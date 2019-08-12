//
//  ImageFetchable.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/12/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

public protocol ImageFetchable: class {
    func getImage(with url: URL, completion: @escaping (UIImage?) -> Void)
}
