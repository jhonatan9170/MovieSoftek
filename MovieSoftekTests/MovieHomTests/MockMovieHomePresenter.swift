//
//  MockMovieHomePresenter.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockMovieHomePresenter: MovieHomeOutputInteractorProtocol {

    var moviesListDidFetchCalled = false
    var moviesListFailedCalled = false
    var moviesResponse: MovieListResponse?
    var error: String?

    func MoviestListDidFetch(moviesResponse: MovieListResponse) {
        moviesListDidFetchCalled = true
        self.moviesResponse = moviesResponse
    }

    func MoviesListFailed(error: String) {
        moviesListFailedCalled = true
        self.error = error
    }
}
