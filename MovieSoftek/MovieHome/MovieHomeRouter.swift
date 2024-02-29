//
//  MovieHomeRouter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

class MovieHomeRouter: MovieHomeRouterProtocol{
    
    var viewController: UIViewController?
    
    static func createMovieHomeModule() -> UIViewController {
        let router: MovieHomeRouter = MovieHomeRouter()
        let interactor: MovieHomeInputInteractorProtocol = MovieHomeInteractor()
        let presenter: MovieHomePresenter & MovieHomeOutputInteractorProtocol = MovieHomePresenter(router: router, interactor: interactor)
        
        let view = MovieHomeViewController(presenter: presenter)
        
        let navigationController = UINavigationController(rootViewController: view)
        
        router.viewController = view
        return navigationController
    }
    
    func goMovieDetail(with movie: MovieEntity) {
        let vc = MovieDetailRouter.createMovieDetailModule(with: movie)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func showError(error: String) {
        viewController?.showErrorAlert(error: error)
    }
}
