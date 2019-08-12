//
//  MEResult.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/12/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

public enum MEResult<T> {
    case success(T)
    case fail(Error)
}
