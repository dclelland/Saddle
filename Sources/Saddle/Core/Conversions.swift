//
//  Conversions.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Foundation
import Plinth
import Numerics

extension Matrix2 where Scalar: Real {
    
    public init(_ matrix: ComplexMatrix<Scalar>) {
        self.init(x: matrix.real, y: matrix.imaginary)
    }
    
}

extension ComplexMatrix where Scalar: SIMDScalar {
    
    public init(_ matrix: Matrix2<Scalar>) {
        self.init(real: matrix.x, imaginary: matrix.y)
    }
    
}
