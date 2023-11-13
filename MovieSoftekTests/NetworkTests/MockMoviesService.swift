//
//  MockMoviesService.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation

@testable import MovieSoftek

class MockMoviesService: MoviesServiceProtocol {
    var shouldReturnError: Bool
    var mockResponse: MovieListResponse?

    init(shouldReturnError: Bool = false, mockResponse: MovieListResponse? = nil) {
        self.shouldReturnError = shouldReturnError
        self.mockResponse = mockResponse
    }

    func getUpcomingMovies(page: Int, completion: @escaping (MovieListResponse?) -> Void) {
        if shouldReturnError {
            completion(nil)
        } else {
            completion(mockResponse)
        }
    }
}
