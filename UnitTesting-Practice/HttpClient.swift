//
//  HttpClient.swift
//  UnitTesting-Practice
//
//  Created by malikj on 14/07/18.
//  Copyright © 2018 malikj. All rights reserved.
//

import Foundation

protocol URLSessionType {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
extension URLSession: URLSessionType { }


enum Result<T> {
    case success(T)
    case failure(Error?)
}

class HTTPClient {
    
    private let session: URLSessionType
    init(session: URLSessionType = URLSession.shared) {
        self.session = session
    }
    
    func fetchData(forURL url: URL, completion: @escaping (Result<Data>) -> Void) {
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) { (data, _, error) in
            guard let data = data else {
                completion(Result.failure(error))
                return
            }
            completion(Result.success(data))
        }
        task.resume()
    }
}

//class HTTPClient_Untestable {
//    func fetchData(forURL url: URL, completion: @escaping (Result<Data>) -> Void) {
//        // Use URLSession.shared to make a network request
//    }
//}
