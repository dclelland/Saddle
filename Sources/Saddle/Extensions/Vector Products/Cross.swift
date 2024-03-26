//
//  Cross.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func cross(_ right: Matrix) -> Matrix {
        return x * right - y * right
    }
    
    public func cross(_ right: Matrix2) -> Matrix {
        return x * right.y - y * right.x
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func cross(_ right: Matrix) -> Matrix {
        return x * right - y * right
    }
    
    public func cross(_ right: Matrix2) -> Matrix {
        return x * right.y - y * right.x
    }
    
}
