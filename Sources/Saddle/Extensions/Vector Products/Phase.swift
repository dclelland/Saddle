//
//  Phase.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Foundation
import Plinth

extension Matrix2 where Scalar == Float {
    
    public func phase() -> Matrix {
        return x.atan2(y)
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func phase() -> Matrix {
        return x.atan2(y)
    }
    
}
