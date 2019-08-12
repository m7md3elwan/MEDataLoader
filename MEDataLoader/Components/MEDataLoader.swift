//
//  MEDataLoader.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/12/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

open class MEDataLoader: DataFetchable {
    
    // MARK:- Properties
    var cache: MECachable
    var dataLoader: MEDownloadable
    
    public static let shared = MEDataLoader()
    
    // MARK:- Init
    init(cache: MECachable = MECache(), dataLoader: MEDownloadable = MEDownloader()) {
        self.cache = cache
        self.dataLoader = dataLoader
    }
    
    // MARK:- Methods
    // MARK: Public methods
    public func getData(with url: URL, cached: Bool = true, completion: @escaping (MEResult<Data>) -> Void) {
        let key = url.absoluteString
        
        if let data = cache.getData(key: key as NSString) as? Data, cached == true {
            completion(MEResult.success(data))
        } else {
            dataLoader.downloadWithURL(url: url)
                .onSuccess { (data) in
                    self.cache.set(data: data, key: key as NSString)
                    completion(MEResult.success(data))
                }.onFail { (error) in
                    completion(MEResult.fail(error))
            }
        }
    }
}

extension MEDataLoader: ImageFetchable {
    public func getImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
        getData(with: url) { (result) in
            switch result {
            case .success(let data):
                completion(UIImage(data: data))
            case .fail(_):
                completion(nil)
            }
        }
    }
}
