//
//  LoginProtocols.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import UIKit

protocol LoginViewProtocol: AnyObject {
    func updateLoading(isLoading:Bool)
}

protocol LoginPresenterProtocol: AnyObject {
    var isTextFieldValid: Bool {get}
    func setViewProtocol(view: LoginViewProtocol)
    func setData(username:String, password: String, keepLogin:Bool)
    func login()

}

protocol LoginInputInteractorProtocol: AnyObject {
    func setPresenterProtocol(presenter: LoginOutputInteractorProtocol)
    func loginUser(username: String, password: String,keepLogin:Bool)
}

protocol LoginOutputInteractorProtocol: AnyObject {
    func loginSucceeded()
    func loginFailed(error:String)
}

protocol LoginRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createLoginModule() -> UIViewController
    func presentMovieHome()
    func showError(error: String)
}
