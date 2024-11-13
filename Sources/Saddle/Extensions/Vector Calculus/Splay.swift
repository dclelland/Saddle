//
//  Splay.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func splay(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        divergence(kernel: kernel).square()
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func splay(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        divergence(kernel: kernel).square()
    }
    
}
