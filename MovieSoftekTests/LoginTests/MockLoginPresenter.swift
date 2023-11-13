//
//  MockLoginPresenter.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockLoginPresenter: LoginOutputInteractorProtocol {
    
    var movies = [MovieEntity]()
    var page = 1
    var totalPages:Int?
    var isFromStorage = false
    
    var loginSuccessCalled = false
    var loginFailedCalled = false
    var errorMessage: String?

    func loginSucceeded() {
        loginSuccessCalled = true
    }

    func loginFailed(error: String) {
        loginFailedCalled = true
        errorMessage = error
    }
}
