//
//  LoginInteractorTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import XCTest

@testable import MovieSoftek


final class LoginInteractorTests: XCTestCase {

    var interactor: LoginInteractor!
    var mockPresenter: MockLoginPresenter!
    var mockLoginService: MockLoginService!

    override func setUp() {
        super.setUp()
        mockPresenter = MockLoginPresenter()
        mockLoginService = MockLoginService()
        interactor = LoginInteractor()
        interactor.presenter = mockPresenter
        interactor.loginService = mockLoginService
    }

    override func tearDown() {
        interactor = nil
        mockLoginService = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testLoginFailureInvalidCredentials() {
        mockLoginService.shouldReturnSuccess = false
        interactor.loginUser(username: "test@example.com", password: "12345678", keepLogin: false)
        XCTAssertTrue(mockPresenter.loginFailedCalled)
        XCTAssertEqual(mockPresenter.errorMessage, "Credenciales invalidas")
    }

    func testLoginFailureEmptyUsername() {
        interactor.loginUser(username: "", password: "12345678", keepLogin: false)
        XCTAssertTrue(mockPresenter.loginFailedCalled)
        XCTAssertEqual(mockPresenter.errorMessage, "Correo inválido")
    }

    func testLoginFailureShortPassword() {
        interactor.loginUser(username: "test@example.com", password: "123", keepLogin: false)
        XCTAssertTrue(mockPresenter.loginFailedCalled)
        XCTAssertEqual(mockPresenter.errorMessage, "Contraseña debe tener minimo 8 caracteres")
    }
    
    func testLoginSuccess() {
        mockLoginService.shouldReturnSuccess = true
        interactor.loginUser(username: "test@example.com", password: "12345678", keepLogin: false)
        XCTAssertTrue(mockPresenter.loginSuccessCalled)
    }

}
