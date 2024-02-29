//
//  LoginInteractor.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import Foundation

class LoginInteractor: LoginInputInteractorProtocol {
    
    private var presenter: LoginOutputInteractorProtocol?
    private let loginService: LoginServiceProtocol
    
    init( loginService: LoginServiceProtocol) {
        self.loginService = loginService
    }
    
    func setPresenterProtocol(presenter: LoginOutputInteractorProtocol) {
        self.presenter = presenter
    }
    
    func loginUser(username: String, password: String, keepLogin:Bool) {
        loginService.login(username: username, password: password) { [weak self] isSuccess in
            if isSuccess {
                UserDefaults.standard.set(keepLogin, forKey: Constants.keepLoginKey)
                self?.presenter?.loginSucceeded()
            } else {
                self?.presenter?.loginFailed(error: "Credenciales invalidas")
            }
        }
    }
}
