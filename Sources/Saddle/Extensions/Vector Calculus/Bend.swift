//
//  Bend.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    func bend(interval: Int = 1) -> Matrix {
        cross(curl(interval: interval)).square()
    }
    
}

extension Matrix2 where Scalar == Double {
    
    func bend(interval: Int = 1) -> Matrix {
        cross(curl(interval: interval)).square()
    }
    
}
