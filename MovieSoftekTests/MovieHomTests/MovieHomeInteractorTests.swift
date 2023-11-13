//
//  MovieHomeInteractorTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import XCTest
@testable import MovieSoftek

final class MovieHomeInteractorTests: XCTestCase {
    
    var interactor: MovieHomeInteractor!
    var mockMoviesService: MockMoviesService!
    var mockPresenter: MockMovieHomePresenter!

    override func setUp() {
        super.setUp()
        mockMoviesService = MockMoviesService()
        mockPresenter = MockMovieHomePresenter()
        interactor = MovieHomeInteractor()
        interactor.moviesService = mockMoviesService
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockMoviesService = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testGetMovieListSuccess() {
        let mockMovieList = MovieListResponse(page: 1, results: [], totalPages: 1)
        mockMoviesService.mockResponse = mockMovieList
        mockMoviesService.shouldReturnError = false

        interactor.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListDidFetchCalled)
        XCTAssertNotNil(mockPresenter.moviesResponse)
    }

    func testGetMovieListFailure() {
        mockMoviesService.shouldReturnError = true

        interactor.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListFailedCalled)
        XCTAssertEqual(mockPresenter.error, "No se pudieron cargar las peliculas")
    }
}
