//
//  Curl.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 where Scalar == Float {
    
    public func curl() -> Matrix {
        let dyx = y.padded(inset: 1).convolve3x3(filter: CentralDifferenceFilter.x3x3).cropped(inset: 1)
        let dxy = x.padded(inset: 1).convolve3x3(filter: CentralDifferenceFilter.y3x3).cropped(inset: 1)
        return dyx - dxy
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func curl() -> Matrix {
        let dyx = y.padded(inset: 1).convolve3x3(filter: CentralDifferenceFilter.x3x3).cropped(inset: 1)
        let dxy = x.padded(inset: 1).convolve3x3(filter: CentralDifferenceFilter.y3x3).cropped(inset: 1)
        return dyx - dxy
    }
    
}
