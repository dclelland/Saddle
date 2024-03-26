//
//  Curl.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func curl(interval: Int = 1) -> Matrix {
        let dxy = (x.shifted(rows: interval) - x.shifted(rows: -interval)) / Scalar(interval * 2)
        let dyx = (y.shifted(columns: interval) - y.shifted(columns: -interval)) / Scalar(interval * 2)
        return dyx - dxy
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func curl(interval: Int = 1) -> Matrix {
        let dxy = (x.shifted(rows: interval) - x.shifted(rows: -interval)) / Scalar(interval * 2)
        let dyx = (y.shifted(columns: interval) - y.shifted(columns: -interval)) / Scalar(interval * 2)
        return dyx - dxy
    }
    
}
