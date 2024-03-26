//
//  Cross.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

//infix operator <x>: MultiplicationPrecedence

//extension Matrix2 where Scalar == Float {
//    
//    @inlinable public static func <x> (left: Matrix2, right: Matrix2) -> Matrix {
//        return left.cross(right)
//    }
//    
//}

extension Matrix2 where Scalar == Float {
    
    public func cross(_ right: Matrix) -> Matrix {
        return x * right - y * right
    }
    
    public func cross(_ right: Matrix2) -> Matrix {
        return x * right.y - y * right.x
    }
    
}

//extension Matrix2 where Scalar == Double {
//    
//    @inlinable public static func <x> (left: Matrix2, right: Matrix2) -> Matrix {
//        return left.cross(right)
//    }
//    
//}

extension Matrix2 where Scalar == Double {
    
    public func cross(_ right: Matrix) -> Matrix {
        return x * right - y * right
    }
    
    public func cross(_ right: Matrix2) -> Matrix {
        return x * right.y - y * right.x
    }
    
}
