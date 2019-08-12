//
//  DataFetchable.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/12/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

public protocol DataFetchable: class {
    func getData(with url: URL, cached: Bool, completion: @escaping (MEResult<Data>) -> Void)
}
