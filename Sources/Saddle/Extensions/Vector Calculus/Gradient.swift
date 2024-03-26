//
//  Gradient.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix where Scalar == Float {
    
    public func gradient(interval: Int = 1) -> Matrix2<Scalar> {
        let dx = shifted(columns: -interval) - shifted(columns: interval) / Scalar(interval * 2)
        let dy = shifted(rows: -interval) - shifted(rows: interval) / Scalar(interval * 2)
        return Matrix2(x: dx, y: dy)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func gradient(interval: Int = 1) -> Matrix2<Scalar> {
        let dx = shifted(columns: -interval) - shifted(columns: interval) / Scalar(interval * 2)
        let dy = shifted(rows: -interval) - shifted(rows: interval) / Scalar(interval * 2)
        return Matrix2(x: dx, y: dy)
    }
    
}
