//
//  MockCoreDataManager.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import CoreData
@testable import MovieSoftek

class MockCoreDataManager: CoreDataManagerProtocol {
    var mockMovies: [MovieEntity] = []
    var saveMovieCalled = false

    func fetchMovies() -> [MovieEntity] {
        return mockMovies
    }

    func saveMovie(movie: MovieEntity) {
        saveMovieCalled = true
    }
}
