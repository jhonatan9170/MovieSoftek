//
//  MovieServiceTest.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import XCTest

@testable import MovieSoftek

final class MoviesServiceTests: XCTestCase {

    var mockAPIClient: MockAPIClient!
    var service: MoviesService!

    override func setUp() {
        super.setUp()
        mockAPIClient = MockAPIClient()
        service = MoviesService(apiClient: mockAPIClient)
    }

    override func tearDown() {
        mockAPIClient = nil
        service = nil
        super.tearDown()
    }

    func testGetUpcomingMoviesSuccess() {
        let mockMovieList = MovieListResponse(page: 1, results: [MovieResponse](), totalPages: 1)
        mockAPIClient.mockResponse = mockMovieList

        let expectation = self.expectation(description: "SuccessFetchMovies")
        service.getUpcomingMovies(page: 1) { response in
            XCTAssertNotNil(response)
            XCTAssertEqual(response?.page, 1)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

    func testGetUpcomingMoviesFailure() {
        mockAPIClient.shouldReturnError = true

        let expectation = self.expectation(description: "FailureFetchMovies")
        service.getUpcomingMovies(page: 1) { response in
            XCTAssertNil(response)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}

