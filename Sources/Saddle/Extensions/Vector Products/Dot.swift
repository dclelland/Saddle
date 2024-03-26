//
//  Dot.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

//infix operator <.>: MultiplicationPrecedence

//extension Matrix2 where Scalar == Float {
//    
//    @inlinable public static func <.> (left: Matrix2, right: Matrix2) -> Matrix {
//        return left.dot(right)
//    }
//    
//}

extension Matrix2 where Scalar == Float {
    
    public func dot(_ right: Matrix) -> Matrix {
        return x * right + y * right
    }
    
    public func dot(_ right: Matrix2) -> Matrix {
        return x * right.x + y * right.y
    }
    
}

//extension Matrix2 where Scalar == Double {
//    
//    @inlinable public static func <.> (left: Matrix2, right: Matrix2) -> Matrix {
//        return left.dot(right)
//    }
//    
//}

extension Matrix2 where Scalar == Double {
    
    public func dot(_ right: Matrix) -> Matrix {
        return x * right + y * right
    }
    
    public func dot(_ right: Matrix2) -> Matrix {
        return x * right.x + y * right.y
    }
    
}
