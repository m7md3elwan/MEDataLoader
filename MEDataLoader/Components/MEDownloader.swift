//
//  MEDownloader.swift
//  MEDataLoader
//
//  Created by Mohamed Mostafa on 8/12/19.
//  Copyright © 2019 Elwan. All rights reserved.
//

import Foundation

open class MEDownloader: NSObject, MEDownloadable {
    
    // MARK:- Properties
    var downloadTasks = [MEDownloadTask]()
    
    lazy var session: URLSession = {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.allowsCellularAccess = true
        sessionConfiguration.requestCachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        return URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
    }()
    
    // MARK:- Init
    
    
    // MARK:- Methods
    // MARK: Private methods
    fileprivate func downloadTaskFor(url: URL) -> MEDownloadTask? {
        return downloadTasks.first{ $0.url == url }
    }
    
    // MARK: Public methods
    public func downloadWithURL(url: URL) -> MEDownloadRequest {
        if let task = downloadTaskFor(url: url) {
            return MEDownloadRequest(task: task)
        } else {
            let downloadTask = MEDownloadTask.init(url: url, manager: self)
            downloadTasks.append(downloadTask)
            downloadTask.start()
            return MEDownloadRequest(task: downloadTask)
        }
    }
    
    public func removeTask(task: MEDownloadTask) {
        if let index = (downloadTasks.firstIndex{ $0 === task }) {
            downloadTasks.remove(at: index)
        }
    }
}

// MARK:-  SessionDelegate
extension MEDownloader :URLSessionDataDelegate,URLSessionDelegate {
    
    public func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        if let url = dataTask.originalRequest?.url, let downloadTask = downloadTaskFor(url: url) {
            downloadTask.data.append(data)
        }
    }
    
    public func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let url = task.originalRequest?.url, let downloadTask = downloadTaskFor(url: url) {
            
            if let error = error  {
                downloadTask.taskFailed(error: error)
            } else{
                downloadTask.taskSuccessed(data: downloadTask.data)
            }
            
            removeTask(task: downloadTask)
        }
    }
    
}
