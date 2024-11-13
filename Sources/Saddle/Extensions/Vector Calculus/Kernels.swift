//
//  Kernels.swift
//  Saddle
//
//  Created by Daniel Clelland on 12/11/24.
//

import Plinth

public enum SobelFilter<Scalar> { }

public enum CentralDifferenceFilter<Scalar> { }

extension SobelFilter where Scalar == Float {
    
    public static let x3x3: Matrix<Scalar> = [
        [-1.0, 0.0, 1.0],
        [-2.0, 0.0, 2.0],
        [-1.0, 0.0, 1.0]
    ] / 8.0
    
    public static let y3x3: Matrix<Scalar> = [
        [-1.0, -2.0, -1.0],
        [0.0, 0.0, 0.0],
        [1.0, 2.0, 1.0]
    ] / 8.0
    
}

extension CentralDifferenceFilter where Scalar == Float {
    
    public static let x3x3: Matrix<Scalar> = [
        [0.0, 0.0, 0.0],
        [-1.0, 0.0, 1.0],
        [0.0, 0.0, 0.0]
    ] / 2.0
    
    public static let y3x3: Matrix<Scalar> = [
        [0.0, -1.0, 0.0],
        [0.0, 0.0, 0.0],
        [0.0, 1.0, 0.0]
    ] / 2.0
    
}

extension SobelFilter where Scalar == Double {
    
    public static let x3x3: Matrix<Scalar> = [
        [-1.0, 0.0, 1.0],
        [-2.0, 0.0, 2.0],
        [-1.0, 0.0, 1.0]
    ] / 8.0
    
    public static let y3x3: Matrix<Scalar> = [
        [-1.0, -2.0, -1.0],
        [0.0, 0.0, 0.0],
        [1.0, 2.0, 1.0]
    ] / 8.0
    
}

extension CentralDifferenceFilter where Scalar == Double {
    
    public static let x3x3: Matrix<Scalar> = [
        [0.0, 0.0, 0.0],
        [-1.0, 0.0, 1.0],
        [0.0, 0.0, 0.0]
    ] / 2.0
    
    public static let y3x3: Matrix<Scalar> = [
        [0.0, -1.0, 0.0],
        [0.0, 0.0, 0.0],
        [0.0, 1.0, 0.0]
    ] / 2.0
    
}
