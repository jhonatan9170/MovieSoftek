//
//  LoginService.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 12/11/23.
//

import Foundation

protocol LoginServiceProtocol {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void)
}

class MockLoginService: LoginServiceProtocol {
    func login(username: String, password: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let isSuccess = username == "admin" && password == "12345678"
            completion(isSuccess)
        }
    }
}
