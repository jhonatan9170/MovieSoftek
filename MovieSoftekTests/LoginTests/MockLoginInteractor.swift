//
//  MockLoginInteractor.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockLoginInteractor: LoginInputInteractorProtocol {
    var presenter: LoginOutputInteractorProtocol?
    
    var receivedUsername: String?
    var receivedPassword: String?
    var keepLogin: Bool = false

    func loginUser(username: String, password: String, keepLogin: Bool) {
        receivedUsername = username
        receivedPassword = password
        self.keepLogin = keepLogin
    }
}
