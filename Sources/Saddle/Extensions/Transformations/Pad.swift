//
//  Pad.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Foundation
import Plinth

extension Matrix2 where Scalar == Float {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Scalar = .zero) -> Matrix2 {
        return fmap { $0.padded(to: shape, rule, repeating: element) }
    }
    
    public func padded(inset: Int, repeating element: Scalar = .zero) -> Matrix2 {
        return fmap { $0.padded(inset: inset, repeating: element) }
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Scalar = .zero) -> Matrix2 {
        return fmap { $0.padded(top: top, left: left, bottom: bottom, right: right) }
    }
    
}

extension Matrix2x2 where Scalar == Float {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Scalar = .zero) -> Matrix2x2 {
        return fmap { $0.padded(to: shape, rule, repeating: element) }
    }
    
    public func padded(inset: Int, repeating element: Scalar = .zero) -> Matrix2x2 {
        return fmap { $0.padded(inset: inset, repeating: element) }
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Scalar = .zero) -> Matrix2x2 {
        return fmap { $0.padded(top: top, left: left, bottom: bottom, right: right) }
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Scalar = .zero) -> Matrix2 {
        return fmap { $0.padded(to: shape, rule, repeating: element) }
    }
    
    public func padded(inset: Int, repeating element: Scalar = .zero) -> Matrix2 {
        return fmap { $0.padded(inset: inset, repeating: element) }
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Scalar = .zero) -> Matrix2 {
        return fmap { $0.padded(top: top, left: left, bottom: bottom, right: right) }
    }
    
}

extension Matrix2x2 where Scalar == Double {
    
    public func padded(to shape: Shape, _ rule: PadRoundingRule = .towardsTopLeft, repeating element: Scalar = .zero) -> Matrix2x2 {
        return fmap { $0.padded(to: shape, rule, repeating: element) }
    }
    
    public func padded(inset: Int, repeating element: Scalar = .zero) -> Matrix2x2 {
        return fmap { $0.padded(inset: inset, repeating: element) }
    }
    
    public func padded(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0, repeating element: Scalar = .zero) -> Matrix2x2 {
        return fmap { $0.padded(top: top, left: left, bottom: bottom, right: right) }
    }
    
}
