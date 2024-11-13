//
//  Curl.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func curl(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        let padding = kernel.shape.breadth / 2
        let dyx = y.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dxy = x.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        return dyx - dxy
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func curl(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix {
        let padding = kernel.shape.breadth / 2
        let dyx = y.padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dxy = x.padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        return dyx - dxy
    }
    
}
