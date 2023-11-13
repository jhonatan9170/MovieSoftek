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
    var mockCoreDataManager: MockCoreDataManager!
    var mockPresenter: MockMovieHomePresenter!

    override func setUp() {
        super.setUp()
        interactor = MovieHomeInteractor()
        mockMoviesService = MockMoviesService()
        mockCoreDataManager = MockCoreDataManager()
        mockPresenter = MockMovieHomePresenter()

        interactor.moviesService = mockMoviesService
        interactor.coreDataMananger = mockCoreDataManager
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockMoviesService = nil
        mockCoreDataManager = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testGetMovieListSuccess() {
        let mockResponse = MovieListResponse(page: 1, results: [], totalPages: 1)
        mockMoviesService.mockResponse = mockResponse
        mockMoviesService.shouldReturnError = false

        interactor.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListDidFetchCalled)
    }

    func testGetMovieListFailureThenFetchFromStorage() {
        mockMoviesService.shouldReturnError = true
        mockCoreDataManager.mockMovies = [MovieEntity(id: 1, title: "Test", rating: "8/10", releaseDate: "", overview: "")]

        interactor.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListDidFetchFromStorageCalled)
    }

    func testGetMovieListFailureAndStorageEmpty() {
        mockMoviesService.shouldReturnError = true
        mockCoreDataManager.mockMovies = []

        interactor.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListFailedCalled)
    }

    func testSaveDataToStorage() {
        let movies = [MovieEntity(id: 1, title: "Test", rating: "8/10", releaseDate: "", overview: "")]
        interactor.saveDataToStorage(movies: movies)

        XCTAssertTrue(mockCoreDataManager.saveMovieCalled)
    }
}
