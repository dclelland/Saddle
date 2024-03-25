//
//  Matrix2.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

public struct Matrix2<Scalar> where Scalar: SIMDScalar {
    
    public typealias Matrix = Plinth.Matrix<Scalar>
    public typealias Vector = SIMD2<Scalar>
    
    public var x: Matrix
    public var y: Matrix
    
    public init(x: Matrix, y: Matrix) {
        self.x = x
        self.y = y
    }
    
    public init(shape: Shape, repeating element: Vector) {
        self.init(
            x: .init(shape: shape, repeating: element.x),
            y: .init(shape: shape, repeating: element.y)
        )
    }
    
    public init(shape: Shape, elements: [Vector]) {
        self.init(
            x: .init(shape: shape, elements: elements.map(\.x)),
            y: .init(shape: shape, elements: elements.map(\.y))
        )
    }
    
    public init(shape: Shape, _ closure: @autoclosure () throws -> Vector) rethrows {
        var elements: [Vector] = []
        elements.reserveCapacity(shape.count)
        for _ in 0..<shape.count {
            elements.append(try closure())
        }
        self.init(shape: shape, elements: elements)
    }
    
    public init(shape: Shape, _ closure: (_ row: Int, _ column: Int) throws -> Vector) rethrows {
        var elements: [Vector] = []
        elements.reserveCapacity(shape.count)
        for row in 0..<shape.rows {
            for column in 0..<shape.columns {
                elements.append(try closure(row, column))
            }
        }
        self.init(shape: shape, elements: elements)
    }
    
}

extension Matrix2 {
    
    public init(element: Vector) {
        self.init(shape: .square(length: 1), elements: [element])
    }
    
    public init(row: [Vector]) {
        self.init(shape: .row(length: row.count), elements: row)
    }
    
    public init(column: [Vector]) {
        self.init(shape: .column(length: column.count), elements: column)
    }
    
    public init(grid: [[Vector]]) {
        self.init(shape: .init(rows: grid.count, columns: grid.first?.count ?? 0), elements: Array(grid.joined()))
    }
    
}

extension Matrix2 {
    
    public static var empty: Matrix2 {
        return .init(shape: .empty, elements: [])
    }
    
}

extension Matrix2 where Scalar: Numeric {
    
    public init(x: Matrix) {
        self.init(x: x, y: .zeros(shape: x.shape))
    }
    
    public init(y: Matrix) {
        self.init(x: .zeros(shape: y.shape), y: y)
    }
    
}

extension Matrix2 {
    
    public enum State: CustomStringConvertible {
        
        case regular
        case malformed(_ malformation: Malformation)
        
        public var description: String {
            switch self {
            case .regular:
                return "Regular"
            case .malformed(let malformation):
                return "Malformed: \(malformation)"
            }
        }
        
    }
    
    public enum Malformation: CustomStringConvertible {
        
        case parts(_ x: Matrix.Malformation, _ y: Matrix.Malformation)
        case xPart(_ x: Matrix.Malformation)
        case yPart(_ y: Matrix.Malformation)
        case shapeMismatch(_ real: Shape, _ imaginary: Shape)
        
        public var description: String {
            switch self {
            case .parts(let x, let y):
                return "Malformed x part: \(x); Malformed y part: \(y)"
            case .xPart(let x):
                return "Malformed x part: \(x)"
            case .yPart(let y):
                return "Malformed y part: \(y)"
            case .shapeMismatch(let x, let y):
                return "Shape mismatch between x and y parts; \(x) ≠ \(y)"
            }
        }
        
    }
    
    public var state: State {
        switch (x.state, y.state) {
        case (.malformed(let x), .malformed(let y)):
            return .malformed(.parts(x, y))
        case (.malformed(let x), .regular):
            return .malformed(.xPart(x))
        case (.regular, .malformed(let y)):
            return .malformed(.yPart(y))
        case (.regular, .regular):
            guard x.shape == y.shape else {
                return .malformed(.shapeMismatch(x.shape, y.shape))
            }
            
            return .regular
        }
    }
    
    public var shape: Shape {
        return Shape(
            rows: Swift.min(x.shape.rows, y.shape.rows),
            columns: Swift.min(x.shape.columns, y.shape.columns)
        )
    }
    
}

extension Matrix2 {
    
    public var elements: [Vector] {
        return Array(self)
    }
    
    public var grid: [[Vector]] {
        return shape.rowIndices.map { row in
            return Array(elements[shape.indicesFor(row: row)])
        }
    }
    
}

extension Matrix2 {
    
    public subscript(row: Int, column: Int) -> Vector {
        get {
            precondition(shape.contains(row: row, column: column))
            return Vector(x[row, column], y[row, column])
        }
        set {
            precondition(shape.contains(row: row, column: column))
            x[row, column] = newValue.x
            y[row, column] = newValue.y
        }
    }
    
}

extension Matrix2: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: [Vector]...) {
        self.init(grid: elements)
    }

}

extension Matrix2: CustomStringConvertible where Scalar: CustomStringConvertible {

    public var description: String {
        switch state {
        case .regular:
            return "[[" + grid.map { $0.map(\.description).joined(separator: ", ") }.joined(separator: "],\n [") + "]]"
        case .malformed(let malformation):
            return "Malformed \(type(of: self)): \(malformation)"
        }
    }

}

extension Matrix2: Equatable where Scalar: Equatable {
    
    public static func == (left: Matrix2, right: Matrix2) -> Bool {
        return left.x == right.x && left.y == right.y
    }
    
}

extension Matrix2: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
    
}

extension Matrix2: Codable where Scalar: Codable {
    
    enum CodingKeys: String, CodingKey {
        case x
        case y
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.x = try container.decode(Matrix.self, forKey: .x)
        self.y = try container.decode(Matrix.self, forKey: .y)
        if case .malformed(let malformation) = self.state {
            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Malformed \(type(of: self)): \(malformation)"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if case .malformed(let malformation) = self.state {
            throw EncodingError.invalidValue(self, .init(codingPath: encoder.codingPath, debugDescription: "Malformed \(type(of: self)): \(malformation)"))
        }
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(x, forKey: .x)
        try container.encode(y, forKey: .y)
    }

}

extension Matrix2: Collection {
    
    public typealias Index = Int

    public var startIndex: Index {
        return 0
    }

    public var endIndex: Index {
        return Swift.min(x.count, y.count)
    }
    
    public func index(after index: Index) -> Index {
        return index + 1
    }

    public subscript(_ index: Index) -> Vector {
        return Vector(x[index], y[index])
    }
    
}

extension Matrix2: BidirectionalCollection {
    
    public func index(before index: Index) -> Index {
        return index - 1
    }
    
    public func reversed() -> Matrix2 {
        return Matrix2(x: x.reversed(), y: y.reversed())
    }
    
}
