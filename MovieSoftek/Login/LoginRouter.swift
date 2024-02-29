//
//  LoginRouter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    
    static func createLoginModule() -> UIViewController {
        let interactor: LoginInputInteractorProtocol = LoginInteractor(loginService: MockLoginService())
        let router: LoginRouterProtocol = LoginRouter()
        let presenter: LoginPresenterProtocol & LoginOutputInteractorProtocol = LoginPresenter(interactor: interactor, router: router)

        let vc = LoginViewController(presenter: presenter)
        let view = vc
        router.viewController = view
        
        return view
    }
    
    var viewController: UIViewController?
    
    func presentMovieHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = MovieHomeRouter.createMovieHomeModule()
            window.makeKeyAndVisible()
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
    
    func showError(error: String) {
        viewController?.showErrorAlert(error: error)
    }
}
