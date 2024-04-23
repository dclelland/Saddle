//
//  Functors.swift
//  Saddle
//
//  Created by Daniel Clelland on 26/03/24.
//

import Plinth

extension Matrix2 {
    
    @inlinable public func fmap<A>(x xFunction: (Matrix) -> Plinth.Matrix<A>, y yFunction: (Matrix) -> Plinth.Matrix<A>) -> Matrix2<A> {
        return Matrix2<A>(
            x: xFunction(x),
            y: yFunction(y)
        )
    }
    
    @inlinable public func fmap<A>(_ function: (Matrix) -> Plinth.Matrix<A>) -> Matrix2<A> {
        return Matrix2<A>(
            x: function(x),
            y: function(y)
        )
    }
    
}

extension Matrix2x2 {
    
    @inlinable public func fmap<A>(xx xxFunction: (Matrix) -> Plinth.Matrix<A>, xy xyFunction: (Matrix) -> Plinth.Matrix<A>, yx yxFunction: (Matrix) -> Plinth.Matrix<A>, yy yyFunction: (Matrix) -> Plinth.Matrix<A>) -> Matrix2x2<A> {
        return Matrix2x2<A>(
            xx: xxFunction(xx),
            xy: xyFunction(xy),
            yx: yxFunction(yx),
            yy: yyFunction(yy)
        )
    }
    
    @inlinable public func fmap<A>(_ function: (Matrix) -> Plinth.Matrix<A>) -> Matrix2x2<A> {
        return Matrix2x2<A>(
            xx: function(xx),
            xy: function(xy),
            yx: function(yx),
            yy: function(yy)
        )
    }
    
}
