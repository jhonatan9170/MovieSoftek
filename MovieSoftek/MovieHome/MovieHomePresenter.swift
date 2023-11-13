//
//  MovieHomePresenter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

class MovieHomePresenter: MovieHomePresenterProtocol {
    
    var movies = [MovieEntity]()
    var page = 1
    var totalPages:Int?
    var isFromStorage = false
    
    var router: MovieHomeRouterProtocol?
    weak var view: MovieHomeViewProtocol?
    var interactor: MovieHomeInputInteractorProtocol?
    
    func loadMovies() {
        if !isFromStorage && (totalPages == nil || page <= totalPages!) {
            view?.updateLoading(isLoading: true)
            interactor?.getMovieList(page: page)
        }
    }
    
    func showMovieSelection(with movie: MovieEntity) {
        router?.goMovieDetail(with: movie)
    }
}

extension MovieHomePresenter: MovieHomeOutputInteractorProtocol {
    func moviestListDidFetchFromStorage(movies: [MovieEntity]) {
        isFromStorage = true
        view?.updateLoading(isLoading: false)
        view?.showMovies(with: movies)
    }
    
    
    func moviesListFailed(error: String) {
        view?.updateLoading(isLoading: false)
        router?.showError(error: error)
    }
    
    func moviestListDidFetch(moviesResponse: MovieListResponse) {
        isFromStorage = false
        let movies = moviesResponse.results.map({$0.toMovieEntity()})
        view?.updateLoading(isLoading: false)
        self.movies.append(contentsOf: movies)
        page+=1
        self.totalPages = moviesResponse.totalPages
        view?.showMovies(with: self.movies)
        interactor?.saveDataToStorage(movies: movies)
    }
}
