//
//  LoginPresenter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var interactor: LoginInputInteractorProtocol?
    var router: LoginRouterProtocol?

    func login(username: String, password: String,keepLogin:Bool) {
        view?.updateLoading(isLoading: true)
        interactor?.loginUser(username: username, password: password,keepLogin: keepLogin)
    }
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func loginSucceeded() {
        view?.updateLoading(isLoading: false)
        router?.presentMovieHome()
    }

    func loginFailed(error:String) {
        view?.updateLoading(isLoading: false)
        router?.showError(error: error)
    }
}
