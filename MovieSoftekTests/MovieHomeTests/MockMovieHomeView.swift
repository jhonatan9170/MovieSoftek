//
//  MockMovieHomeView.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockMovieHomeView: MovieHomeViewProtocol {

    var isLoadingUpdated = false
    var isLoading = false
    var showMoviesCalled = false

    func updateLoading(isLoading: Bool) {
        self.isLoadingUpdated = true
        self.isLoading = isLoading
    }

    func showMovies() {
       showMoviesCalled = true
    }
}
