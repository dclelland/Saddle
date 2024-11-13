//
//  Gradient.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix where Scalar == Float {
    
    public func gradient() -> Matrix2<Scalar> {
        let dx = padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dy = padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        return Matrix2(x: dx, y: dy)
    }
    
}

extension Matrix where Scalar == Double {
    
    public func gradient() -> Matrix2<Scalar> {
        let dx = padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dy = padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        return Matrix2(x: dx, y: dy)
    }
    
}
