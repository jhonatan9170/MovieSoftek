//
//  MovieDetailPresenterTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//
import XCTest

@testable import MovieSoftek

final class MovieDetailPresenterTests: XCTestCase {

    var presenter: MovieDetailPresenter!
    var mockView: MockMovieDetailView!

    override func setUp() {
        super.setUp()
        presenter = MovieDetailPresenter()
        mockView = MockMovieDetailView()
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        super.tearDown()
    }

    func testViewDidLoadWithMovie() {
        let movie = MovieEntity(id: 1, title: "Test Movie", rating: "8/10", releaseDate: "", overview: "")
        presenter.movie = movie
        
        presenter.viewDidLoad()
        
        XCTAssertTrue(mockView.isShowMovieDetailCalled)
        XCTAssertEqual(mockView.movieDetail, movie)
    }

    func testViewDidLoadWithoutMovie() {
        presenter.movie = nil

        presenter.viewDidLoad()

        XCTAssertFalse(mockView.isShowMovieDetailCalled)
    }
}
