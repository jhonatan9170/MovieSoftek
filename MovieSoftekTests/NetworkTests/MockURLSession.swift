//
//  MockURLSession.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockURLSession: URLSessionProtocol {
    var nextData: Data?
    var nextError: Error?
    var nextResponse: URLResponse?
    
    private (set) var lastRequest: URLRequest?
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        lastRequest = request
        completionHandler(nextData, nextResponse, nextError)
        return MockURLSessionDataTask()
    }
}

class MockURLSessionDataTask: URLSessionDataTask {
    override func resume() {
    }
}

struct MockDecodable: Codable {
    let key: String
}
