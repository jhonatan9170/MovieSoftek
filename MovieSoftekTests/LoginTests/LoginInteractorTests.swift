//
//  LoginInteractorTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import XCTest

@testable import MovieSoftek


final class LoginInteractorTests: XCTestCase {

    var sut: LoginInteractor!
    var mockPresenter: MockLoginPresenter!
    var mockLoginService: MockLoginService!

    override func setUp() {
        super.setUp()
        mockPresenter = MockLoginPresenter()
        mockLoginService = MockLoginService()
        sut = LoginInteractor(loginService: mockLoginService)
        sut.setPresenterProtocol(presenter:mockPresenter)
    }

    override func tearDown() {
        sut = nil
        mockLoginService = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testLoginFailureInvalidCredentials() {
        mockLoginService.shouldReturnSuccess = false
        sut.loginUser(username: "test@example.com", password: "12345678", keepLogin: false)
        XCTAssertTrue(mockPresenter.loginFailedCalled)
        XCTAssertEqual(mockPresenter.errorMessage, "Credenciales invalidas")
    }
    
    func testLoginSuccess() {
        mockLoginService.shouldReturnSuccess = true
        sut.loginUser(username: "test@example.com", password: "12345678", keepLogin: false)
        XCTAssertTrue(mockPresenter.loginSuccessCalled)
    }

}
