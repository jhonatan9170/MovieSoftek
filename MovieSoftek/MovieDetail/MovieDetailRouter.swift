//
//  MovieDetailRouter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

class MovieDetailRouter: MovieDetailRouterProtocol {
    
    static func createMovieDetailModule(with movie: MovieEntity) -> UIViewController {
        let storyboard = UIStoryboard(name: "MoviesStoryboard", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else  {
            return UIViewController()
        }
        let view = vc
        let presenter: MovieDetailPresenter = MovieDetailPresenter()
        let router: MovieDetailRouter = MovieDetailRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.movie = movie
        presenter.router = router
        
        return view
    }
    
}
