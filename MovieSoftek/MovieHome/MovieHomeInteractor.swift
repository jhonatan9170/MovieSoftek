//
//  MovieHomeInteractor.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation

class MovieHomeInteractor: MovieHomeInputInteractorProtocol {
    
    var presenter: MovieHomeOutputInteractorProtocol?
    var moviesService: MoviesServiceProtocol = MoviesService()


    func getMovieList(page: Int) {
        moviesService.getUpcomingMovies(page: page) {[weak self] movies in
            guard let movies else {
                self?.presenter?.MoviesListFailed(error: "No se pudieron cargar las peliculas")
                return
            }
            self?.presenter?.MoviestListDidFetch(moviesResponse: movies)
        }
    }
}
