//
//  MockLoginView.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class LoginViewMock: LoginViewProtocol {
    var isLoading: Bool = false

    func updateLoading(isLoading: Bool) {
        self.isLoading = isLoading
    }
}
