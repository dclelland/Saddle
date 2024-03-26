//
//  Jacobian.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func jacobian(interval: Int = 1) -> Matrix2x2<Scalar> {
        let dxx = (x.shifted(columns: interval) - x.shifted(columns: -interval)) / Scalar(interval * 2)
        let dxy = (x.shifted(rows: interval) - x.shifted(rows: -interval)) / Scalar(interval * 2)
        let dyx = (y.shifted(columns: interval) - y.shifted(columns: -interval)) / Scalar(interval * 2)
        let dyy = (y.shifted(rows: interval) - y.shifted(rows: -interval)) / Scalar(interval * 2)
        return Matrix2x2(xx: dxx, xy: dxy, yx: dyx, yy: dyy)
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func jacobian(interval: Int = 1) -> Matrix2x2<Scalar> {
        let dxx = (x.shifted(columns: interval) - x.shifted(columns: -interval)) / Scalar(interval * 2)
        let dxy = (x.shifted(rows: interval) - x.shifted(rows: -interval)) / Scalar(interval * 2)
        let dyx = (y.shifted(columns: interval) - y.shifted(columns: -interval)) / Scalar(interval * 2)
        let dyy = (y.shifted(rows: interval) - y.shifted(rows: -interval)) / Scalar(interval * 2)
        return Matrix2x2(xx: dxx, xy: dxy, yx: dyx, yy: dyy)
    }
    
}

extension Matrix2x2 where Scalar == Float {
    
    public func trace() -> Matrix {
        return xx + yy
    }
    
    public func determinant() -> Matrix {
        return xx * yy - xy * yx
    }
    
    public func discriminant() -> Matrix {
        return trace().square() - 4.0 * determinant()
    }
    
}

extension Matrix2x2 where Scalar == Double {
    
    public func trace() -> Matrix {
        return xx + yy
    }
    
    public func determinant() -> Matrix {
        return xx * yy - xy * yx
    }
    
    public func discriminant() -> Matrix {
        return trace().square() - 4.0 * determinant()
    }
    
}
