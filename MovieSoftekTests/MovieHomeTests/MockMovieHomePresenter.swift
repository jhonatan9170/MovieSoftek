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
    var moviesListDidFetchFromStorageCalled = false
    var moviesListFailedCalled = false
    var error: String?

    func moviestListDidFetch(moviesResponse: MovieListResponse) {
        moviesListDidFetchCalled = true
    }

    func moviestListDidFetchFromStorage(movies: [MovieEntity]) {
        moviesListDidFetchFromStorageCalled = true
    }

    func moviesListFailed(error: String) {
        moviesListFailedCalled = true
        self.error = error
    }
}

