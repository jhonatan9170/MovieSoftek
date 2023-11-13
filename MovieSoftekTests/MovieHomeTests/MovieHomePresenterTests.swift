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
    var mockInteractor: MockMovieHomeInteractor!

    override func setUp() {
        super.setUp()
        presenter = MovieHomePresenter()
        mockView = MockMovieHomeView()
        mockRouter = MockMovieHomeRouter()
        mockInteractor = MockMovieHomeInteractor()

        presenter.view = mockView
        presenter.router = mockRouter
        presenter.interactor = mockInteractor
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        super.tearDown()
    }

    func testLoadMovies() {
        
        presenter.totalPages = 10
        presenter.page = 5
        presenter.isFromStorage = false
        
        presenter.loadMovies()
        
        XCTAssertTrue(mockView.isLoadingUpdated)
        XCTAssertTrue(mockInteractor.getMovieListCalled)
    }

    func testShowMovieSelection() {
        let movie = MovieEntity(id: 1, title: "Test Movie", rating: "8/10", releaseDate: "", overview: "")
        presenter.showMovieSelection(with: movie)
        XCTAssertTrue(mockRouter.movieDetailNavigationCalled)
        XCTAssertEqual(mockRouter.movieDetailEntity, movie)

    }
    
    func testGetMoviesIsNotCalledWhenIsFromStorage(){
        presenter.totalPages = 10
        presenter.page = 15
        presenter.isFromStorage = true
        
        presenter.loadMovies()
        
        XCTAssertFalse(mockInteractor.getMovieListCalled)
    }
    
    func testGetMoviesIsNotCalledWhenTotalPageIsMorethanCurrentPage(){
        presenter.totalPages = 10
        presenter.page = 15
        
        presenter.loadMovies()
        
        XCTAssertFalse(mockInteractor.getMovieListCalled)
    }
    
    func testGetMoviesIsCalledWhenTotalPageIsNil(){
        presenter.totalPages = nil
        
        presenter.loadMovies()
        
        XCTAssertTrue(mockInteractor.getMovieListCalled)
    }
    
    
    func testMoviestListDidFetch() {
        let movieListResponse = MovieListResponse(page: 1, results: [], totalPages: 1)
        presenter.moviestListDidFetch(moviesResponse: movieListResponse)
        XCTAssertFalse(mockView.isLoadingUpdated)
        XCTAssertEqual(presenter.movies.count, movieListResponse.results.count)
        XCTAssertTrue(mockInteractor.saveDataToStorageCalled)
    }

    func testMoviestListDidFetchFromStorage() {
        let movies = [MovieEntity(id: 1, title: "Test Movie", rating: "8/10", releaseDate: "", overview: "")]
        presenter.moviestListDidFetchFromStorage(movies: movies)
        XCTAssertTrue(presenter.isFromStorage)
        XCTAssertEqual(mockView.moviesShown, movies)
    }

    func testMoviesListFailed() {
        presenter.moviesListFailed(error: "Error")
        XCTAssertFalse(mockView.isLoadingUpdated)
        XCTAssertEqual(mockRouter.errorShown, "Error")
    }
}
