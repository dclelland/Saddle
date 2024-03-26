//
//  Functors.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 {
    
    @inlinable public func fmap<A>(x xFunction: (Matrix) -> Plinth.Matrix<A>, y yFunction: (Matrix) -> Plinth.Matrix<A>) -> Matrix2<A> {
        return Matrix2<A>(x: xFunction(x), y: yFunction(y))
    }
    
}
