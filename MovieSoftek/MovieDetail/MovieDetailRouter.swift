//
//  MovieDetailRouter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    
    static func createMovieDetailModule(with movie: MovieEntity) -> UIViewController {
        let router = MovieDetailRouter()

        let presenter = MovieDetailPresenter(router: router, _movie: movie)
        
        let view = MovieDetailViewController(presenter: presenter)

        return view
    }
    
}
