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
        let storyboard = UIStoryboard(name: "MoviesStoryboard", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieHomeViewController") as? MovieHomeViewController else  {
            return UIViewController()
        }
        let view = vc
        let presenter: MovieHomePresenter & MovieHomeOutputInteractorProtocol = MovieHomePresenter()
        let interactor: MovieHomeInputInteractorProtocol = MovieHomeInteractor()
        let router: MovieHomeRouter = MovieHomeRouter()
        router.viewController = view
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: vc)

        return navigationController
    }
    
    func goMovieDetail(with movie: MovieEntity) {
        
    }
    
    func showError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.showErrorAlert(error: error)
        }
    }
}
