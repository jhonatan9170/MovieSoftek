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
    var moviesShown: [MovieEntity]?
    var errorShown: String?

    func updateLoading(isLoading: Bool) {
        isLoadingUpdated = isLoading
    }

    func showMovies(with movies: [MovieEntity]) {
        moviesShown = movies
    }
}
