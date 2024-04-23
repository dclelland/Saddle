//
//  Crop.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Foundation
import Plinth

extension Matrix2 where Scalar == Float {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> Matrix2 {
        return fmap { $0.cropped(to: shape, rule) }
    }
    
    public func cropped(inset: Int) -> Matrix2 {
        return fmap { $0.cropped(inset: inset) }
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix2 {
        return fmap { $0.cropped(top: top, left: left, bottom: bottom, right: right) }
    }
    
}

extension Matrix2x2 where Scalar == Float {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> Matrix2x2 {
        return fmap { $0.cropped(to: shape, rule) }
    }
    
    public func cropped(inset: Int) -> Matrix2x2 {
        return fmap { $0.cropped(inset: inset) }
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix2x2 {
        return fmap { $0.cropped(top: top, left: left, bottom: bottom, right: right) }
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> Matrix2 {
        return fmap { $0.cropped(to: shape, rule) }
    }
    
    public func cropped(inset: Int) -> Matrix2 {
        return fmap { $0.cropped(inset: inset) }
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix2 {
        return fmap { $0.cropped(top: top, left: left, bottom: bottom, right: right) }
    }
    
}

extension Matrix2x2 where Scalar == Double {
    
    public func cropped(to shape: Shape, _ rule: CropRoundingRule = .towardsTopLeft) -> Matrix2x2 {
        return fmap { $0.cropped(to: shape, rule) }
    }
    
    public func cropped(inset: Int) -> Matrix2x2 {
        return fmap { $0.cropped(inset: inset) }
    }
    
    public func cropped(top: Int = 0, left: Int = 0, bottom: Int = 0, right: Int = 0) -> Matrix2x2 {
        return fmap { $0.cropped(top: top, left: left, bottom: bottom, right: right) }
    }
    
}
