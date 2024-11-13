//
//  Gradient.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix where Scalar == Float {
    
    public func gradient(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix2<Scalar> {
        let padding = kernel.shape.breadth / 2
        let dx = padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dy = padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        return Matrix2(x: dx, y: dy)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func gradient(kernel: Matrix2<Scalar> = Kernel.centralDifference3x3) -> Matrix2<Scalar> {
        let padding = kernel.shape.breadth / 2
        let dx = padded(inset: padding).convolve(filter: kernel.x).cropped(inset: padding)
        let dy = padded(inset: padding).convolve(filter: kernel.y).cropped(inset: padding)
        return Matrix2(x: dx, y: dy)
    }
    
}
