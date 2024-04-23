//
//  Splay.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func splay(interval: Int = 1) -> Matrix {
        divergence(interval: interval).square()
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func splay(interval: Int = 1) -> Matrix {
        divergence(interval: interval).square()
    }
    
}
