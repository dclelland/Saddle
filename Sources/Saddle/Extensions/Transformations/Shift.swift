//
//  Shift.swift
//  Saddle
//
//  Created by Daniel Clelland on 23/04/24.
//

import Foundation
import Plinth

extension Matrix2 where Scalar == Float {
    
    public func shifted(rows: Int) -> Matrix2 {
        return fmap { $0.shifted(rows: rows) }
    }
    
    public func shifted(columns: Int) -> Matrix2 {
        return fmap { $0.shifted(columns: columns) }
    }
    
    public func shifted(rows: Int, columns: Int) -> Matrix2 {
        return fmap { $0.shifted(rows: rows, columns: columns) }
    }
    
}

extension Matrix2x2 where Scalar == Float {
    
    public func shifted(rows: Int) -> Matrix2x2 {
        return fmap { $0.shifted(rows: rows) }
    }
    
    public func shifted(columns: Int) -> Matrix2x2 {
        return fmap { $0.shifted(columns: columns) }
    }
    
    public func shifted(rows: Int, columns: Int) -> Matrix2x2 {
        return fmap { $0.shifted(rows: rows, columns: columns) }
    }
    
}

extension Matrix2 where Scalar == Double {
    
    public func shifted(rows: Int) -> Matrix2 {
        return fmap { $0.shifted(rows: rows) }
    }
    
    public func shifted(columns: Int) -> Matrix2 {
        return fmap { $0.shifted(columns: columns) }
    }
    
    public func shifted(rows: Int, columns: Int) -> Matrix2 {
        return fmap { $0.shifted(rows: rows, columns: columns) }
    }
    
}

extension Matrix2x2 where Scalar == Double {
    
    public func shifted(rows: Int) -> Matrix2x2 {
        return fmap { $0.shifted(rows: rows) }
    }
    
    public func shifted(columns: Int) -> Matrix2x2 {
        return fmap { $0.shifted(columns: columns) }
    }
    
    public func shifted(rows: Int, columns: Int) -> Matrix2x2 {
        return fmap { $0.shifted(rows: rows, columns: columns) }
    }
    
}
