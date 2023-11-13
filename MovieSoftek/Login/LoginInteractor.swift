//
//  LoginInteractor.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import Foundation

class LoginInteractor: LoginInputInteractorProtocol {    
    var presenter: LoginOutputInteractorProtocol?
    var loginService: LoginServiceProtocol = MockLoginService()

    func loginUser(username: String, password: String, keepLogin:Bool) {
        
        guard !username.isEmpty else  {
            presenter?.loginFailed(error: "Correo inválido")
            return
        }
        
        guard password.count > 7 else  {
            presenter?.loginFailed(error: "Contraseña debe tener minimo 8 caracteres")
            return
        }

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
