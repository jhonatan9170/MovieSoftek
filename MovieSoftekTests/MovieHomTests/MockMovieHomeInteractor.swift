//
//  MockMovieHomeInteractor.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockMovieHomeInteractor: MovieHomeInputInteractorProtocol {
    var presenter: MovieHomeOutputInteractorProtocol?
    
    var isMovieListRequested = false

    func getMovieList(page: Int) {
        isMovieListRequested = true
    }
}
