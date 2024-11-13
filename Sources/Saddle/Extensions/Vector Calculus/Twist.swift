//
//  Twist.swift
//  Plinth
//
//  Created by Daniel Clelland on 23/04/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func twist() -> Matrix {
        dot(curl()).square()
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func twist() -> Matrix {
        dot(curl()).square()
    }
    
}
