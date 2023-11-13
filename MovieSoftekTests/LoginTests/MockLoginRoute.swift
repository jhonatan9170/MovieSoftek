//
//  MockLoginRoute.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit
@testable import MovieSoftek

class MockLoginRouter: LoginRouterProtocol {
    
    var viewController: UIViewController?
    
    var isMovieHomePresented = false
    var receivedError: String?

    func presentMovieHome() {
        isMovieHomePresented = true
    }

    func showError(error: String) {
        receivedError = error
    }
    
    static func createLoginModule() -> UIViewController {
        return UIViewController()
    }
}
