//
//  APIClientTest.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import XCTest
@testable import MovieSoftek

final class APIClientTests: XCTestCase {
    
    var apiClient: APIClient!
    var mockURLSession: MockURLSession!
    
    override func setUp() {
        super.setUp()
        apiClient = APIClient.shared
        mockURLSession = MockURLSession()
        apiClient.session = mockURLSession
    }
    
    override func tearDown() {
        apiClient = nil
        mockURLSession = nil
        super.tearDown()
    }
    
    func testRequestWithInvalidURL() {
        let expectation = self.expectation(description: "Completion handler invoked with error")
        
        apiClient.request(url: "ht tp://invalid-url", method: .get) { (result: Result<MockDecodable, APIClientError>) in
            switch result {
            case .failure(let apiError):
                if case .badURL = apiError {
                    expectation.fulfill()
                } else {
                    XCTFail("Expected bad URL error, received another error.")
                }
            case .success:
                XCTFail("Expected bad URL error, received success.")
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRequestWithNetworkError() {
            let expectation = self.expectation(description: "Network error")
            
            apiClient.request(url: "https://example.com", method: .get) { (result: Result<MockDecodable, APIClientError>) in
                switch result {
                case .failure(let apiError):
                    if case .networkError = apiError {
                        expectation.fulfill()
                    } else {
                        XCTFail("Expected network error, received another error.")
                    }
                case .success:
                    XCTFail("Expected network error, received success.")
                }
            }
            waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRequestWithBadHTTResponse() {
        let expectation = self.expectation(description: "Decoding error")
        
        let urlResponse = HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 400, httpVersion: nil, headerFields: nil)
        mockURLSession.nextResponse = urlResponse
        
        apiClient.request(url: "https://example.com", method: .get) { (result: Result<MockDecodable, APIClientError>) in
            switch result {
            case .failure(let apiError):
                if case .httpError(_) = apiError {
                    expectation.fulfill()
                } else {
                    XCTFail("Expected decoding error, received another error.")
                }
            case .success:
                XCTFail("Expected decoding error, received success.")
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRequestWithDecodingError() {
        let expectation = self.expectation(description: "Decoding error")
        
        let incorrectJSONData = "{\"incorrectKey\":\"value\"}".data(using: .utf8)
        mockURLSession.nextData = incorrectJSONData
        
        apiClient.request(url: "https://example.com", method: .get) { (result: Result<MockDecodable, APIClientError>) in
            switch result {
            case .failure(let apiError):
                if case .decodingError = apiError {
                    expectation.fulfill()
                } else {
                    XCTFail("Expected decoding error, received another error.")
                }
            case .success:
                XCTFail("Expected decoding error, received success.")
            }
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testGetRequestSuccess() {
        let expectation = self.expectation(description: "GET request successful")
        
        mockURLSession.nextError = nil
        
        let correctJSONData = "{\"key\":\"value\"}".data(using: .utf8)
        mockURLSession.nextData = correctJSONData
        
        apiClient.request(url: "https://example.com", method: .get) { (result: Result<MockDecodable, APIClientError>) in
            switch result {
            case .success(let decodedData):
                XCTAssertEqual(decodedData.key, "value", "Decoded data should match the mock data")
                expectation.fulfill()
            case .failure(let _):
                XCTFail("Expected successful GET request")
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testPostRequestSuccess() {
        let expectation = self.expectation(description: "POST request successful")
        
        // Simulate a successful POST request by providing valid data
        let correctJSONData = "{\"key\":\"value\"}".data(using: .utf8)
        mockURLSession.nextData = correctJSONData
        
        let parameters = ["param1": "value1", "param2": "value2"]
        
        apiClient.request(url: "https://example.com", method: .post, parameters: parameters) { (result: Result<MockDecodable, APIClientError>) in
            switch result {
            case .success(let decodedData):
                XCTAssertEqual(decodedData.key, "value", "Decoded data should match the mock data")
                expectation.fulfill()
                XCTAssertEqual(self.mockURLSession.lastRequest?.httpMethod, "POST", "HTTP method should be POST")
                XCTAssertNotNil(self.mockURLSession.lastRequest?.httpBody, "HTTP body for POST should not be nil")
            case .failure:
                XCTFail("Expected successful POST request")
            }
        }
        // busi
        waitForExpectations(timeout: 1, handler: nil)
    }

}
