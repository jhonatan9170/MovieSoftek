//
//  MovieHomeInteractor.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation

class MovieHomeInteractor: MovieHomeInputInteractorProtocol {

    private var presenter: MovieHomeOutputInteractorProtocol?
    private let moviesService: MoviesServiceProtocol
    
    private let coreDataMananger:CoreDataManagerProtocol

    init(moviesService: MoviesServiceProtocol, coreDataMananger: CoreDataManagerProtocol) {
        self.moviesService = moviesService
        self.coreDataMananger = coreDataMananger
    }
    
    convenience init() {
        self.init(moviesService: MoviesService(), coreDataMananger: CoreDataManager.shared)
    }
    
    func setPresenterProtocol(presenter: MovieHomeOutputInteractorProtocol) {
        self.presenter = presenter
    }
    
    func getMovieList(page: Int) {
        moviesService.getUpcomingMovies(page: page) {[weak self] movies in
            guard let movies else {
                self?.getDataFromStorage()
                return
            }
            self?.presenter?.moviestListDidFetch(moviesResponse: movies)
        }
    }
    
    func getDataFromStorage() {
        let movies = coreDataMananger.fetchMovies()
        guard !movies.isEmpty  else {
            self.presenter?.moviesListFailed(error: "No se pudieron cargar las peliculas")
            return
        }
        
        presenter?.moviestListDidFetchFromStorage(movies: movies)
    }
    
    func saveDataToStorage(movies: [MovieEntity]) {
        for movie in movies {
            coreDataMananger.saveMovie(movie: movie)
        }
    }
}
