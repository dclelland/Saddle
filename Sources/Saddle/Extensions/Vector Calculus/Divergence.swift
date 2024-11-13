//
//  Divergence.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func divergence() -> Matrix {
        let dxx = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dyy = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        return dxx + dyy
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func divergence() -> Matrix {
        let dxx = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dyy = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        return dxx + dyy
    }
    
}
