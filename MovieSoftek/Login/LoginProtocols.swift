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
    var view: LoginViewProtocol? {get set}
    var interactor: LoginInputInteractorProtocol? {get set}
    var router: LoginRouterProtocol? {get set}
    
    func login(username: String, password: String,keepLogin:Bool)

}

protocol LoginInputInteractorProtocol: AnyObject {
    var presenter: LoginOutputInteractorProtocol? {get set}
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
