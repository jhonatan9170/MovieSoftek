//
//  MovieHomePresenter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

class MovieHomePresenter: MovieHomePresenterProtocol {

    private var _movies = [MovieEntity]()
    
    var page = 1
    var totalPages:Int?
    var isFromStorage = false
    
    var movies: [MovieEntity] {
        get{_movies}
        set{_movies = newValue}
    }
    
    private let router: MovieHomeRouterProtocol
    private let interactor: MovieHomeInputInteractorProtocol
    private weak var view: MovieHomeViewProtocol?
    private let mainDispatchQueue: DispatchQueueType

    func setViewProtocol(view: MovieHomeViewProtocol) {
        self.view = view
    }
    
    func movieCellAtIndex(_ index: Int) -> MovieEntity {
        return _movies[index]
    }
    
    init(router: MovieHomeRouterProtocol, interactor: MovieHomeInputInteractorProtocol, mainDispatchQueue: DispatchQueueType) {
        self.router = router
        self.interactor = interactor
        self.mainDispatchQueue = mainDispatchQueue
        interactor.setPresenterProtocol(presenter: self)
    }
    convenience init(router: MovieHomeRouterProtocol, interactor: MovieHomeInputInteractorProtocol) {
        self.init(router: router, interactor: interactor, mainDispatchQueue: DispatchQueue.main)
    }
    
    func loadMovies() {
        if !isFromStorage && (totalPages == nil || page <= totalPages!) {
            view?.updateLoading(isLoading: true)
            interactor.getMovieList(page: page)
        }
    }
    
    func showMovieSelection(with index: Int) {
        let movie = _movies[index]
        router.goMovieDetail(with: movie)
    }
}

extension MovieHomePresenter: MovieHomeOutputInteractorProtocol {
    func moviestListDidFetchFromStorage(movies: [MovieEntity]) {
        isFromStorage = true
        mainDispatchQueue.async {[weak self] in
            self?.view?.updateLoading(isLoading: false)
            self?.view?.showMovies()
        }
    }
    
    
    func moviesListFailed(error: String) {
        view?.updateLoading(isLoading: false)
        router.showError(error: error)
    }
    
    func moviestListDidFetch(moviesResponse: MovieListResponse) {
        isFromStorage = false
        let movies = moviesResponse.results.map({MovieEntity(movieResponse: $0)})
        self._movies.append(contentsOf: movies)
        page+=1
        self.totalPages = moviesResponse.totalPages
        interactor.saveDataToStorage(movies: movies)
        mainDispatchQueue.async {[weak self] in
            self?.view?.updateLoading(isLoading: false)
            self?.view?.showMovies()
        }
    }
}
