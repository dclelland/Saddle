//
//  Divergence.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func divergence(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        let padding = kernel.shape.breadth / 2
        let dxx = x.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dyy = y.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        return dxx + dyy
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func divergence(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        let padding = kernel.shape.breadth / 2
        let dxx = x.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dyy = y.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        return dxx + dyy
    }
    
}
