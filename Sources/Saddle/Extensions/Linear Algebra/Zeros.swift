//
//  Zeros.swift
//  Saddle
//
//  Created by Daniel Clelland on 15/04/24.
//

import Foundation

extension Matrix2 where Scalar: Numeric {
    
    public static func zeros(shape: Shape) -> Matrix {
        return .init(
            x: .zeros(shape: shape),
            y: .zeros(shape: shape)
        )
    }
    
}

extension Matrix2x2 where Scalar: Numeric {

    public static func zeros(shape: Shape) -> Matrix2x2 {
        return .init(
            xx: .zeros(shape: shape),
            xy: .zeros(shape: shape),
            yx: .zeros(shape: shape),
            yy: .zeros(shape: shape)
        )
    }
    
}
