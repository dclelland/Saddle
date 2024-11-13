//
//  Gradient.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix where Scalar == Float {
    
    public func gradient() -> Matrix2<Scalar> {
        let dx = padded(inset: 1).convolve3x3(filter: SobelFilter.x3x3).cropped(inset: 1)
        let dy = padded(inset: 1).convolve3x3(filter: SobelFilter.y3x3).cropped(inset: 1)
        return Matrix2(x: dx, y: dy)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func gradient() -> Matrix2<Scalar> {
        let dx = padded(inset: 1).convolve3x3(filter: SobelFilter.x3x3).cropped(inset: 1)
        let dy = padded(inset: 1).convolve3x3(filter: SobelFilter.y3x3).cropped(inset: 1)
        return Matrix2(x: dx, y: dy)
    }
    
}
