//
//  LoginRouter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    static func createLoginModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "MoviesStoryboard", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else  {
            return UIViewController()
        }
        let view = vc
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenter()
        let interactor: LoginInputInteractorProtocol = LoginInteractor()
        let router: LoginRouterProtocol = LoginRouter()
        router.viewController = view
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    var viewController: UIViewController?
    
    func presentMovieHome() {
        DispatchQueue.main.async {
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = MovieHomeRouter.createMovieHomeModule()
                window.makeKeyAndVisible()
                UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }
    }
    func showError(error: String) {
        DispatchQueue.main.async { [weak self] in
            self?.viewController?.showErrorAlert(error: error)
        }
    }
}
