//
//  Laplacian.swift
//  Saddle
//
//  Created by Daniel Clelland on 13/11/24.
//

import Plinth

extension Matrix where Scalar == Float {
    
    public func laplacian(kernel: Matrix<Scalar> = Kernel.laplacian3x3) -> Matrix<Scalar> {
        let padding = kernel.shape.breadth / 2
        return padded(inset: padding).convolve(filter: kernel).cropped(inset: padding)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func laplacian(kernel: Matrix<Scalar> = Kernel.laplacian3x3) -> Matrix<Scalar> {
        let padding = kernel.shape.breadth / 2
        return padded(inset: padding).convolve(filter: kernel).cropped(inset: padding)
    }
    
}
