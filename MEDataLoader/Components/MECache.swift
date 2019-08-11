//
//  MECache.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/10/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

open class MECache: NSObject, MECachable {
    
    // MARK:- Properties
    private var cache = NSCache<NSString, MEDiscardableData>()
    var cacheLimit: Int = 100 {
        didSet {
            setCacheMaxLimit(cacheLimit: cacheLimit)
        }
    }
    
    // MARK:- Init
    override init() {
        super.init()
        cache.delegate = self
        setCacheMaxLimit(cacheLimit: cacheLimit)
    }
    
    // MARK:- Methods
    // MARK: Private methods
    fileprivate func setCacheMaxLimit(cacheLimit: Int) {
        cache.countLimit = cacheLimit
    }
    
    
    // MARK: Public methods
    func getData(key: NSString) -> Any? {
        if let cachedObject = cache.object(forKey: key) {
            return cachedObject.data
        }
        return nil
    }
    
    func set(data: Any?, key: NSString) {
        let data = MEDiscardableData(data: data)
        cache.setObject(data, forKey: key)
    }
    
    func clearCache() {
        cache.removeAllObjects()
    }
}

extension MECache: NSCacheDelegate {
    public func cache(_ cache: NSCache<AnyObject, AnyObject>, willEvictObject obj: Any) {
        print("object \(obj) evicted")
    }
}

