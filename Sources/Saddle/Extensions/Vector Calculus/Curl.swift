//
//  Curl.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func curl() -> Matrix {
        let dyx = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dxy = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        return dyx - dxy
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func curl() -> Matrix {
        let dyx = y.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.x5x5).cropped(inset: 2)
        let dxy = x.padded(inset: 2).convolve5x5(filter: CentralDifferenceFilter.y5x5).cropped(inset: 2)
        return dyx - dxy
    }
    
}
