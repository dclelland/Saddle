//
//  Arithmetic.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    @inlinable public static prefix func + (operand: Matrix2) -> Matrix2 {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Matrix2) -> Matrix2 {
        return operand.fmap(
            x: { -$0 },
            y: { -$0 }
        )
    }

}

extension Matrix2 where Scalar == Float {

    @inlinable public static func * (left: Matrix2, right: Scalar) -> Matrix2 {
        return left.fmap(
            x: { $0 * right },
            y: { $0 * right }
        )
    }

    @inlinable public static func / (left: Matrix2, right: Scalar) -> Matrix2 {
        return left.fmap(
            x: { $0 / right },
            y: { $0 / right }
        )
    }

}

extension Matrix2 where Scalar == Float {
    
    @inlinable public static func * (left: Scalar, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left * $0 },
            y: { left * $0 }
        )
    }
    
    @inlinable public static func / (left: Scalar, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left / $0 },
            y: { left / $0 }
        )
    }

}

extension Matrix2 where Scalar == Float {

    @inlinable public static func * (left: Matrix2, right: Matrix) -> Matrix2 {
        return left.fmap(
            x: { $0 * right.elements },
            y: { $0 * right.elements }
        )
    }

    @inlinable public static func / (left: Matrix2, right: Matrix) -> Matrix2 {
        return left.fmap(
            x: { $0 / right.elements },
            y: { $0 / right.elements }
        )
    }

}

extension Matrix2 where Scalar == Float {

    @inlinable public static func * (left: Matrix, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left.elements * $0 },
            y: { left.elements * $0 }
        )
    }

    @inlinable public static func / (left: Matrix, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left.elements / $0 },
            y: { left.elements * $0 }
        )
    }

}

extension Matrix2 where Scalar == Float {

    @inlinable public static func + (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 + right.x.elements },
            y: { $0 + right.y.elements }
        )
    }

    @inlinable public static func - (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 - right.x.elements },
            y: { $0 - right.y.elements }
        )
    }

    @inlinable public static func * (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 * right.x.elements },
            y: { $0 * right.y.elements }
        )
    }

    @inlinable public static func / (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 / right.x.elements },
            y: { $0 / right.y.elements }
        )
    }

}

extension Matrix2 where Scalar == Float {

    @inlinable public static func *= (left: inout Matrix2, right: Scalar) {
        left = left * right
    }

    @inlinable public static func /= (left: inout Matrix2, right: Scalar) {
        left = left / right
    }
}

extension Matrix2 where Scalar == Float {
    
    @inlinable public static func *= (left: inout Matrix2, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix2, right: Matrix) {
        left = left / right
    }

}

extension Matrix2 where Scalar == Float {

    @inlinable public static func += (left: inout Matrix2, right: Matrix2) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Matrix2, right: Matrix2) {
        left = left - right
    }

    @inlinable public static func *= (left: inout Matrix2, right: Matrix2) {
        left = left * right
    }

    @inlinable public static func /= (left: inout Matrix2, right: Matrix2) {
        left = left / right
    }
    
}

extension Matrix2 where Scalar == Double {
    
    @inlinable public static prefix func + (operand: Matrix2) -> Matrix2 {
        return operand
    }
    
    @inlinable public static prefix func - (operand: Matrix2) -> Matrix2 {
        return operand.fmap(
            x: { -$0 },
            y: { -$0 }
        )
    }

}

extension Matrix2 where Scalar == Double {

    @inlinable public static func * (left: Matrix2, right: Scalar) -> Matrix2 {
        return left.fmap(
            x: { $0 * right },
            y: { $0 * right }
        )
    }

    @inlinable public static func / (left: Matrix2, right: Scalar) -> Matrix2 {
        return left.fmap(
            x: { $0 / right },
            y: { $0 / right }
        )
    }

}

extension Matrix2 where Scalar == Double {
    
    @inlinable public static func * (left: Scalar, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left * $0 },
            y: { left * $0 }
        )
    }
    
    @inlinable public static func / (left: Scalar, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left / $0 },
            y: { left / $0 }
        )
    }

}

extension Matrix2 where Scalar == Double {

    @inlinable public static func * (left: Matrix2, right: Matrix) -> Matrix2 {
        return left.fmap(
            x: { $0 * right.elements },
            y: { $0 * right.elements }
        )
    }

    @inlinable public static func / (left: Matrix2, right: Matrix) -> Matrix2 {
        return left.fmap(
            x: { $0 / right.elements },
            y: { $0 / right.elements }
        )
    }

}

extension Matrix2 where Scalar == Double {

    @inlinable public static func * (left: Matrix, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left.elements * $0 },
            y: { left.elements * $0 }
        )
    }

    @inlinable public static func / (left: Matrix, right: Matrix2) -> Matrix2 {
        return right.fmap(
            x: { left.elements / $0 },
            y: { left.elements * $0 }
        )
    }

}

extension Matrix2 where Scalar == Double {

    @inlinable public static func + (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 + right.x.elements },
            y: { $0 + right.y.elements }
        )
    }

    @inlinable public static func - (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 - right.x.elements },
            y: { $0 - right.y.elements }
        )
    }

    @inlinable public static func * (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 * right.x.elements },
            y: { $0 * right.y.elements }
        )
    }

    @inlinable public static func / (left: Matrix2, right: Matrix2) -> Matrix2 {
        return left.fmap(
            x: { $0 / right.x.elements },
            y: { $0 / right.y.elements }
        )
    }

}

extension Matrix2 where Scalar == Double {

    @inlinable public static func *= (left: inout Matrix2, right: Scalar) {
        left = left * right
    }

    @inlinable public static func /= (left: inout Matrix2, right: Scalar) {
        left = left / right
    }
}

extension Matrix2 where Scalar == Double {
    
    @inlinable public static func *= (left: inout Matrix2, right: Matrix) {
        left = left * right
    }
    
    @inlinable public static func /= (left: inout Matrix2, right: Matrix) {
        left = left / right
    }

}

extension Matrix2 where Scalar == Double {

    @inlinable public static func += (left: inout Matrix2, right: Matrix2) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Matrix2, right: Matrix2) {
        left = left - right
    }

    @inlinable public static func *= (left: inout Matrix2, right: Matrix2) {
        left = left * right
    }

    @inlinable public static func /= (left: inout Matrix2, right: Matrix2) {
        left = left / right
    }
    
}
