//
//  MockLoginService.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation
@testable import MovieSoftek

class MockLoginService: LoginServiceProtocol {
    var shouldReturnSuccess: Bool

    init(shouldReturnSuccess: Bool = true) {
        self.shouldReturnSuccess = shouldReturnSuccess
    }

    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        completion(shouldReturnSuccess)
    }
}
