//
//  MockAPIClient.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

@testable import MovieSoftek

class MockAPIClient: APIClientProtocol {
    var shouldReturnError: Bool
    var mockResponse: MovieListResponse?

    init(shouldReturnError: Bool = false, mockResponse: MovieListResponse? = nil) {
        self.shouldReturnError = shouldReturnError
        self.mockResponse = mockResponse
    }

    func request<T>(url: String, method: HTTPMethod, headers: [String : String]?, parameters: [String : Any]?, completion: @escaping (Result<T, APIClientError>) -> Void) where T : Decodable {
        if shouldReturnError {
            completion(.failure(.networkError))
        } else if let mockResponse = mockResponse as? T {
            completion(.success(mockResponse))
        }
    }
}
