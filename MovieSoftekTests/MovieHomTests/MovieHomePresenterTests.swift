//
//  MovieHomePresenterTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import XCTest
@testable import MovieSoftek

final class MovieHomePresenterTests: XCTestCase {

    var presenter: MovieHomePresenter!
    var mockView: MockMovieHomeView!
    var mockRouter: MockMovieHomeRouter!

    override func setUp() {
        super.setUp()
        presenter = MovieHomePresenter()
        mockView = MockMovieHomeView()
        mockRouter = MockMovieHomeRouter()

        presenter.view = mockView
        presenter.router = mockRouter
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockRouter = nil
        super.tearDown()
    }

    func testLoadMovies() {
        presenter.loadMovies()
        XCTAssertTrue(mockView.isLoadingUpdated)
    }

    func testShowMovieSelection() {
        let movie = MovieEntity(id: 1, title: "Test Movie", rating: "8/10", releaseDate: "", overview: "")
        presenter.showMovieSelection(with: movie)
        XCTAssertEqual(mockRouter.movieDetailEntity, movie)
    }

    func testMoviesListDidFetch() {
        let movieListResponse = MovieListResponse(page: 1, results: [], totalPages: 2)
        presenter.MoviestListDidFetch(moviesResponse: movieListResponse)
        XCTAssertFalse(mockView.isLoadingUpdated)
        XCTAssertEqual(presenter.movies.count, movieListResponse.results.count)
    }

    func testMoviesListFailed() {
        let error = "Network Error"
        presenter.MoviesListFailed(error: error)
        XCTAssertFalse(mockView.isLoadingUpdated)
        XCTAssertEqual(mockRouter.errorShown, error)
    }
}
