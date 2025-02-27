//
//  Kernels.swift
//  Saddle
//
//  Created by Daniel Clelland on 12/11/24.
//

import Plinth

public enum Kernel<Scalar> { }

extension Kernel where Scalar == Float {
    
    public static let sobel3x3 = Matrix2<Scalar>(
        x: [
            [-1.0, 0.0, 1.0],
            [-2.0, 0.0, 2.0],
            [-1.0, 0.0, 1.0]
        ],
        y: [
            [-1.0, -2.0, -1.0],
            [0.0, 0.0, 0.0],
            [1.0, 2.0, 1.0]
        ]
    ) / 8.0
    
    public static let sobel5x5 = Matrix2<Scalar>(
        x: [
            [-1.0, -2.0, 0.0, 2.0, 1.0],
            [-4.0, -8.0, 0.0, 8.0, 4.0],
            [-6.0, -12.0, 0.0, 12.0, 6.0],
            [-4.0, -8.0, 0.0, 8.0, 4.0],
            [-1.0, -2.0, 0.0, 2.0, 1.0]
        ],
        y: [
            [-1.0, -4.0, -6.0, -4.0, -1.0],
            [-2.0, -8.0, -12.0, -8.0, -2.0],
            [0.0, 0.0, 0.0, 0.0, 0.0],
            [2.0, 8.0, 12.0, 8.0, 2.0],
            [1.0, 4.0, 6.0, 4.0, 1.0]
        ]
    ) / 96.0
    
    public static let centralDifference3x3 = Matrix2<Scalar>(
        x: [
            [0.0, 0.0, 0.0],
            [-1.0, 0.0, 1.0],
            [0.0, 0.0, 0.0]
        ],
        y: [
            [0.0, -1.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0]
        ]
    ) / 2.0
    
    public static let centralDifference5x5 = Matrix2<Scalar>(
        x: [
            [0.0, 0.0, 0.0, 0.0, 0.0],
            [-1.0, -8.0, 0.0, 8.0, 1.0],
            [-2.0, -16.0, 0.0, 16.0, 2.0],
            [-1.0, -8.0, 0.0, 8.0, 1.0],
            [0.0, 0.0, 0.0, 0.0, 0.0]
        ],
        y: [
            [0.0, -1.0, -2.0, -1.0, 0.0],
            [0.0, -8.0, -16.0, -8.0, 0.0],
            [0.0, 0.0, 0.0, 0.0, 0.0],
            [0.0, 8.0, 16.0, 8.0, 0.0],
            [0.0, 1.0, 2.0, 1.0, 0.0]
        ]
    ) / 72.0
    
    public static let laplacian3x3 = Matrix<Scalar>(
        grid: [
            [0.0, 1.0, 0.0],
            [1.0, -4.0, 1.0],
            [0.0, 1.0, 0.0]
        ]
    ) / 8.0
    
    public static let laplacian5x5 = Matrix<Scalar>(
        grid: [
            [0.0, 0.0, 1.0, 0.0, 0.0],
            [0.0, 1.0, 2.0, 1.0, 0.0],
            [1.0, 2.0, -16.0, 2.0, 1.0],
            [0.0, 1.0, 2.0, 1.0, 0.0],
            [0.0, 0.0, 1.0, 0.0, 0.0]
        ]
    ) / 32.0
    
}

extension Kernel where Scalar == Double {
    
    public static let sobel3x3 = Matrix2<Scalar>(
        x: [
            [-1.0, 0.0, 1.0],
            [-2.0, 0.0, 2.0],
            [-1.0, 0.0, 1.0]
        ],
        y: [
            [-1.0, -2.0, -1.0],
            [0.0, 0.0, 0.0],
            [1.0, 2.0, 1.0]
        ]
    ) / 8.0
    
    public static let sobel5x5 = Matrix2<Scalar>(
        x: [
            [-1.0, -2.0, 0.0, 2.0, 1.0],
            [-4.0, -8.0, 0.0, 8.0, 4.0],
            [-6.0, -12.0, 0.0, 12.0, 6.0],
            [-4.0, -8.0, 0.0, 8.0, 4.0],
            [-1.0, -2.0, 0.0, 2.0, 1.0]
        ],
        y: [
            [-1.0, -4.0, -6.0, -4.0, -1.0],
            [-2.0, -8.0, -12.0, -8.0, -2.0],
            [0.0, 0.0, 0.0, 0.0, 0.0],
            [2.0, 8.0, 12.0, 8.0, 2.0],
            [1.0, 4.0, 6.0, 4.0, 1.0]
        ]
    ) / 96.0
    
    public static let centralDifference3x3 = Matrix2<Scalar>(
        x: [
            [0.0, 0.0, 0.0],
            [-1.0, 0.0, 1.0],
            [0.0, 0.0, 0.0]
        ],
        y: [
            [0.0, -1.0, 0.0],
            [0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0]
        ]
    ) / 2.0
    
    public static let centralDifference5x5 = Matrix2<Scalar>(
        x: [
            [0.0, 0.0, 0.0, 0.0, 0.0],
            [-1.0, -8.0, 0.0, 8.0, 1.0],
            [-2.0, -16.0, 0.0, 16.0, 2.0],
            [-1.0, -8.0, 0.0, 8.0, 1.0],
            [0.0, 0.0, 0.0, 0.0, 0.0]
        ],
        y: [
            [0.0, -1.0, -2.0, -1.0, 0.0],
            [0.0, -8.0, -16.0, -8.0, 0.0],
            [0.0, 0.0, 0.0, 0.0, 0.0],
            [0.0, 8.0, 16.0, 8.0, 0.0],
            [0.0, 1.0, 2.0, 1.0, 0.0]
        ]
    ) / 72.0
    
    public static let laplacian3x3 = Matrix<Scalar>(
        grid: [
            [0.0, 1.0, 0.0],
            [1.0, -4.0, 1.0],
            [0.0, 1.0, 0.0]
        ]
    ) / 8.0
    
    public static let laplacian5x5 = Matrix<Scalar>(
        grid: [
            [0.0, 0.0, 1.0, 0.0, 0.0],
            [0.0, 1.0, 2.0, 1.0, 0.0],
            [1.0, 2.0, -16.0, 2.0, 1.0],
            [0.0, 1.0, 2.0, 1.0, 0.0],
            [0.0, 0.0, 1.0, 0.0, 0.0]
        ]
    ) / 32.0
    
}
