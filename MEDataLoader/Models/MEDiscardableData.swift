//
//  MEDiscardableData.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/10/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

final class MEDiscardableData: NSObject {
    
    // MARK:- Properties
    private(set) public var data : Any?
    var  accessedCounter : UInt = 0
    
    // MARK:- Init
    public init(data:Any?) {
        self.data = data
    }
    
}

// MARK:- NSDiscardableContent
extension MEDiscardableData: NSDiscardableContent {
    public func beginContentAccess() -> Bool {
        if data == nil {
            return false
        }
        accessedCounter += 1
        return true
    }
    
    public func endContentAccess() {
        if accessedCounter > 0 {
            accessedCounter -= 1
        }
    }
    
    public func discardContentIfPossible() {
        if accessedCounter == 0 {
            data = nil
        }
    }
    
    public func isContentDiscarded() -> Bool {
        return data == nil ? true : false
    }
}
