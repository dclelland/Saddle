//
//  Bend.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func bend(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        cross(curl(kernel: kernel)).square()
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func bend(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        cross(curl(kernel: kernel)).square()
    }
    
}
