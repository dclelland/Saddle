//
//  Jacobian.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func jacobian(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix2x2<Scalar> {
        let padding = kernel.shape.breadth / 2
        let dxx = x.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dxy = x.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        let dyx = y.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dyy = y.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        return Matrix2x2(xx: dxx, xy: dxy, yx: dyx, yy: dyy)
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func jacobian(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix2x2<Scalar> {
        let padding = kernel.shape.breadth / 2
        let dxx = x.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dxy = x.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        let dyx = y.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dyy = y.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
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
