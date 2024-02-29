//
//  LoginPresenter.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    private weak var view: LoginViewProtocol?
    private let interactor: LoginInputInteractorProtocol
    private let router: LoginRouterProtocol
    private let mainDispatchQueue: DispatchQueueType
    
    private var username = ""
    private var password = ""
    private var keepLogin = false
    
    var isTextFieldValid: Bool {
        let cond1 = username.count > 4
        let cond2 = password.count > 7
        return cond1 && cond2
    }
    
    init(interactor: LoginInputInteractorProtocol, router: LoginRouterProtocol,mainDispatchQueue:DispatchQueueType) {
        self.interactor = interactor
        self.router = router
        self.mainDispatchQueue = mainDispatchQueue
        interactor.setPresenterProtocol(presenter: self)
    }
    
    convenience init(interactor: LoginInputInteractorProtocol, router: LoginRouterProtocol) {
        self.init(interactor: interactor, router: router, mainDispatchQueue: DispatchQueue.main)
    }
    
    func setViewProtocol(view: LoginViewProtocol) {
        self.view = view
    }
    
    func setData(username: String, password: String, keepLogin: Bool) {
        self.username = username
        self.password = password
        self.keepLogin = keepLogin
    }
    
    func login() {
        view?.updateLoading(isLoading: true)
        interactor.loginUser(username: username, password: password,keepLogin: keepLogin)
    }
    
}

extension LoginPresenter: LoginOutputInteractorProtocol {
    func loginSucceeded() {
        mainDispatchQueue.async { [weak self] in
            self?.view?.updateLoading(isLoading: false)
            self?.router.presentMovieHome()
        }
    }

    func loginFailed(error:String) {
        mainDispatchQueue.async { [weak self] in
            self?.view?.updateLoading(isLoading: false)
            self?.router.showError(error: error)
        }
    }
}
