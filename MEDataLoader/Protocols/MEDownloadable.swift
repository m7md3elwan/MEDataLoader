//
//  MEDownloadable.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/12/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

protocol MEDownloadable {
    func downloadWithURL(url: URL) -> MEDownloadRequest
    func removeTask(task: MEDownloadTask)
}
