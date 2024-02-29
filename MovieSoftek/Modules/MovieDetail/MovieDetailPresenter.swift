//
//  MovieDetailPresenter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

class MovieDetailPresenter: MovietDetailPresenterProtocol {

    private weak var view: MovieDetailViewProtocol?
    private var router:MovieDetailRouterProtocol
    private var _movie: MovieEntity
    
    var movie: MovieEntity {_movie}
    
    init(router: MovieDetailRouterProtocol, _movie: MovieEntity) {
        self.router = router
        self._movie = _movie
    }
    
    func setViewProtocol(view: MovieDetailViewProtocol) {
        self.view = view
    }
    
}
