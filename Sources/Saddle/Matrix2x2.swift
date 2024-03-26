//
//  Matrix2x2.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

//public protocol SIMDMatrixScalar { }
//extension Float: SIMDMatrixScalar { }
//extension Double: SIMDMatrixScalar { }
//
//public protocol SIMDMatrix {
//    
//    associatedtype Scalar: SIMDMatrixScalar
//    
//}
//
//extension simd_float2x2: SIMDMatrix {
//    
//    public typealias Scalar = Float
//    
//}
//
//extension simd_double2x2: SIMDMatrix {
//    
//    public typealias Scalar = Double
//
//}

public struct Matrix2x2<Scalar> where Scalar: SIMDScalar {
    
    public typealias Matrix = Plinth.Matrix<Scalar>
    public typealias SIMDMatrix = SIMD4<Scalar>
    
    public var xx: Matrix
    public var xy: Matrix
    public var yx: Matrix
    public var yy: Matrix
    
    public init(xx: Matrix, xy: Matrix, yx: Matrix, yy: Matrix) {
        self.xx = xx
        self.xy = xy
        self.yx = yx
        self.yy = yy
    }
    
    public init(shape: Shape, repeating element: SIMDMatrix) {
        self.init(
            xx: .init(shape: shape, repeating: element.x),
            xy: .init(shape: shape, repeating: element.y),
            yx: .init(shape: shape, repeating: element.z),
            yy: .init(shape: shape, repeating: element.w)
        )
    }
    
    public init(shape: Shape, elements: [SIMDMatrix]) {
        self.init(
            xx: .init(shape: shape, elements: elements.map( \.x)),
            xy: .init(shape: shape, elements: elements.map(\.y)),
            yx: .init(shape: shape, elements: elements.map(\.z)),
            yy: .init(shape: shape, elements: elements.map(\.w))
        )
    }
    
    public init(shape: Shape, _ closure: @autoclosure () throws -> SIMDMatrix) rethrows {
        var elements: [SIMDMatrix] = []
        elements.reserveCapacity(shape.count)
        for _ in 0..<shape.count {
            elements.append(try closure())
        }
        self.init(shape: shape, elements: elements)
    }
    
    public init(shape: Shape, _ closure: (_ row: Int, _ column: Int) throws -> SIMDMatrix) rethrows {
        var elements: [SIMDMatrix] = []
        elements.reserveCapacity(shape.count)
        for row in 0..<shape.rows {
            for column in 0..<shape.columns {
                elements.append(try closure(row, column))
            }
        }
        self.init(shape: shape, elements: elements)
    }
    
}

extension Matrix2x2 {
    
    public init(element: SIMDMatrix) {
        self.init(shape: .square(length: 1), elements: [element])
    }
    
    public init(row: [SIMDMatrix]) {
        self.init(shape: .row(length: row.count), elements: row)
    }
    
    public init(column: [SIMDMatrix]) {
        self.init(shape: .column(length: column.count), elements: column)
    }
    
    public init(grid: [[SIMDMatrix]]) {
        self.init(shape: .init(rows: grid.count, columns: grid.first?.count ?? 0), elements: Array(grid.joined()))
    }
    
}

extension Matrix2x2 {
    
    public static var empty: Matrix2x2 {
        return .init(shape: .empty, elements: [])
    }
    
}

extension Matrix2x2 {
    
//    public enum State: CustomStringConvertible {
//        
//        case regular
//        case malformed(_ malformation: Malformation)
//        
//        public var description: String {
//            switch self {
//            case .regular:
//                return "Regular"
//            case .malformed(let malformation):
//                return "Malformed: \(malformation)"
//            }
//        }
//        
//    }
//    
//    public enum Malformation: CustomStringConvertible {
//        
//        case parts(_ x: Matrix.Malformation, _ y: Matrix.Malformation)
//        case xPart(_ x: Matrix.Malformation)
//        case yPart(_ y: Matrix.Malformation)
//        case shapeMismatch(_ x: Shape, _ y: Shape)
//        
//        public var description: String {
//            switch self {
//            case .parts(let x, let y):
//                return "Malformed x part: \(x); Malformed y part: \(y)"
//            case .xPart(let x):
//                return "Malformed x part: \(x)"
//            case .yPart(let y):
//                return "Malformed y part: \(y)"
//            case .shapeMismatch(let x, let y):
//                return "Shape mismatch between x and y parts; \(x) ≠ \(y)"
//            }
//        }
//        
//    }
//    
//    public var state: State {
//        switch (x.state, y.state) {
//        case (.malformed(let x), .malformed(let y)):
//            return .malformed(.parts(x, y))
//        case (.malformed(let x), .regular):
//            return .malformed(.xPart(x))
//        case (.regular, .malformed(let y)):
//            return .malformed(.yPart(y))
//        case (.regular, .regular):
//            guard x.shape == y.shape else {
//                return .malformed(.shapeMismatch(x.shape, y.shape))
//            }
//            
//            return .regular
//        }
//    }
    
    public var shape: Shape {
        return Shape(
            rows: parts.map(\.shape.rows).min()!,
            columns: parts.map(\.shape.columns).min()!
        )
    }
    
    public var parts: [Matrix] {
        return [xx, xy, yx, yy]
    }
    
}

extension Matrix2x2 {
    
    public var elements: [SIMDMatrix] {
        return Array(self)
    }
    
    public var grid: [[SIMDMatrix]] {
        return shape.rowIndices.map { row in
            return Array(elements[shape.indicesFor(row: row)])
        }
    }
    
}

extension Matrix2x2 {
    
    public subscript(row: Int, column: Int) -> SIMDMatrix {
        get {
            precondition(shape.contains(row: row, column: column))
            return SIMDMatrix(xx[row, column], xy[row, column], yx[row, column], yy[row, column])
        }
        set {
            precondition(shape.contains(row: row, column: column))
            xx[row, column] = newValue.x
            xy[row, column] = newValue.y
            yx[row, column] = newValue.z
            yy[row, column] = newValue.w
        }
    }
    
}

extension Matrix2x2: ExpressibleByArrayLiteral {

    public init(arrayLiteral elements: [SIMDMatrix]...) {
        self.init(grid: elements)
    }

}

//extension Matrix2x2: CustomStringConvertible where Scalar: CustomStringConvertible {
//
//    public var description: String {
//        switch state {
//        case .regular:
//            return "[[" + grid.map { $0.map(\.description).joined(separator: ", ") }.joined(separator: "],\n [") + "]]"
//        case .malformed(let malformation):
//            return "Malformed \(type(of: self)): \(malformation)"
//        }
//    }
//
//}

extension Matrix2x2: Equatable where Scalar: Equatable {
    
    public static func == (left: Matrix2x2, right: Matrix2x2) -> Bool {
        return left.parts == right.parts
    }
    
}

extension Matrix2x2: Hashable where Scalar: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(parts)
    }
    
}

//extension Matrix2x2: Codable where Scalar: Codable {
//    
//    enum CodingKeys: String, CodingKey {
//        case xx
//        case xy
//        case yx
//        case yy
//    }
//    
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.xx = try container.decode(Matrix.self, forKey: .xx)
//        self.xy = try container.decode(Matrix.self, forKey: .xy)
//        self.yx = try container.decode(Matrix.self, forKey: .yx)
//        self.yy = try container.decode(Matrix.self, forKey: .yy)
//        if case .malformed(let malformation) = self.state {
//            throw DecodingError.dataCorrupted(.init(codingPath: container.codingPath, debugDescription: "Malformed \(type(of: self)): \(malformation)"))
//        }
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        if case .malformed(let malformation) = self.state {
//            throw EncodingError.invalidValue(self, .init(codingPath: encoder.codingPath, debugDescription: "Malformed \(type(of: self)): \(malformation)"))
//        }
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(xx, forKey: .xx)
//        try container.encode(xy, forKey: .xy)
//        try container.encode(yx, forKey: .yx)
//        try container.encode(yy, forKey: .yy)
//    }
//
//}

extension Matrix2x2: Collection {
    
    public typealias Index = Int

    public var startIndex: Index {
        return 0
    }

    public var endIndex: Index {
        return Swift.min(xx.count, xy.count, yx.count, yy.count)
    }
    
    public func index(after index: Index) -> Index {
        return index + 1
    }

    public subscript(_ index: Index) -> SIMDMatrix {
        return SIMDMatrix(xx[index], xy[index], yx[index], yy[index])
    }
    
}

extension Matrix2x2: BidirectionalCollection {
    
    public func index(before index: Index) -> Index {
        return index - 1
    }
    
    public func reversed() -> Matrix2x2 {
        return Matrix2x2(xx: xx.reversed(), xy: xy.reversed(), yx: yx.reversed(), yy: yy.reversed())
    }
    
}
