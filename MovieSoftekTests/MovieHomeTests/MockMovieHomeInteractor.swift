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
    
    var getMovieListCalled = false
    var saveDataToStorageCalled = false

    func getMovieList(page: Int) {
        getMovieListCalled = true
    }

    func saveDataToStorage(movies: [MovieEntity]) {
        saveDataToStorageCalled = true
    }
    
}
