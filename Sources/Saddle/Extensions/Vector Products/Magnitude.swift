//
//  Magnitude.swift
//  Magnitude
//
//  Created by Daniel Clelland on 23/04/24.
//

import Foundation
import Plinth

extension Matrix2 where Scalar == Float {
    
    public func magnitude() -> Matrix {
        return x.hypot(y)
    }
    
    public func squareMagnitude() -> Matrix {
        return x.distanceSquared(y)
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func magnitude() -> Matrix {
        return x.hypot(y)
    }
    
    public func squareMagnitude() -> Matrix {
        return x.distanceSquared(y)
    }
    
}
