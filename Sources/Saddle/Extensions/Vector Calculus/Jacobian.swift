//
//  Jacobian.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func jacobian() -> Matrix2x2<Scalar> {
        let dxx = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dxy = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        let dyx = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dyy = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        return Matrix2x2(xx: dxx, xy: dxy, yx: dyx, yy: dyy)
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func jacobian() -> Matrix2x2<Scalar> {
        let dxx = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dxy = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        let dyx = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dyy = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
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
