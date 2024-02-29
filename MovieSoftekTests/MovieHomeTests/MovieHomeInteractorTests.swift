//
//  MovieHomeInteractorTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import XCTest
@testable import MovieSoftek

final class MovieHomeInteractorTests: XCTestCase {

    var sut: MovieHomeInteractor!
    var mockMoviesService: MockMoviesService!
    var mockCoreDataManager: MockCoreDataManager!
    var mockPresenter: MockMovieHomePresenter!

    override func setUp() {
        super.setUp()
        mockMoviesService = MockMoviesService()
        mockCoreDataManager = MockCoreDataManager()
        mockPresenter = MockMovieHomePresenter()
        sut = MovieHomeInteractor(moviesService: mockMoviesService, coreDataMananger: mockCoreDataManager)
        sut.setPresenterProtocol(presenter: mockPresenter)
    }

    override func tearDown() {
        sut = nil
        mockMoviesService = nil
        mockCoreDataManager = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testGetMovieListSuccess() {
        let mockResponse = MovieListResponse(page: 1, results: [], totalPages: 1)
        mockMoviesService.mockResponse = mockResponse
        mockMoviesService.shouldReturnError = false

        sut.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListDidFetchCalled)
    }

    func testGetMovieListFailureThenFetchFromStorage() {
        mockMoviesService.shouldReturnError = true
        mockCoreDataManager.mockMovies = [MovieEntity(id: 1, title: "Test", rating: "8/10", releaseDate: "", overview: "")]

        sut.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListDidFetchFromStorageCalled)
    }

    func testGetMovieListFailureAndStorageEmpty() {
        mockMoviesService.shouldReturnError = true
        mockCoreDataManager.mockMovies = []

        sut.getMovieList(page: 1)

        XCTAssertTrue(mockPresenter.moviesListFailedCalled)
    }

    func testSaveDataToStorage() {
        let movies = [MovieEntity(id: 1, title: "Test", rating: "8/10", releaseDate: "", overview: "")]
        sut.saveDataToStorage(movies: movies)

        XCTAssertTrue(mockCoreDataManager.saveMovieCalled)
    }
}
