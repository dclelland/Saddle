//
//  Divergence.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func divergence(interval: Int = 1) -> Matrix {
        let dxx = (x.shifted(columns: -interval) - x.shifted(columns: interval)) / Scalar(interval * 2)
        let dyy = (y.shifted(rows: -interval) - y.shifted(rows: interval)) / Scalar(interval * 2)
        return dxx + dyy
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func divergence(interval: Int = 1) -> Matrix {
        let dxx = (x.shifted(columns: -interval) - x.shifted(columns: interval)) / Scalar(interval * 2)
        let dyy = (y.shifted(rows: -interval) - y.shifted(rows: interval)) / Scalar(interval * 2)
        return dxx + dyy
    }
    
}
