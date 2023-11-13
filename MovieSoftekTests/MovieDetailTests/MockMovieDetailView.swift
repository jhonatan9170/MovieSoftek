//
//  MockMovieDetailView.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockMovieDetailView: MovieDetailViewProtocol {
    var isShowMovieDetailCalled = false
    var movieDetail: MovieEntity?

    func showMovieDetail(with movie: MovieEntity) {
        isShowMovieDetailCalled = true
        movieDetail = movie
    }
}
