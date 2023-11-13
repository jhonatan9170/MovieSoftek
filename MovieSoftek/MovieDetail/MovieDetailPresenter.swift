//
//  MovieDetailPresenter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

class MovieDetailPresenter: MovietDetailPresenterProtocol {
    
    weak var view: MovieDetailViewProtocol?
    var router:MovieDetailRouterProtocol?
    var movie: MovieEntity?
    
    func viewDidLoad() {
        if let movie{
            view?.showMovieDetail(with: movie)
        }
        
    }
}
