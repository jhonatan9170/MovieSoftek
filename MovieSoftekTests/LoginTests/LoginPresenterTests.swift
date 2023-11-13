//
//  LoginPresenterTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import XCTest
@testable import MovieSoftek

class LoginPresenterTests: XCTestCase {
    var presenter: LoginPresenter!
    var viewMock: LoginViewMock!
    var interactorMock: MockLoginInteractor!
    var routerMock: MockLoginRouter!

    override func setUp() {
        super.setUp()
        viewMock = LoginViewMock()
        interactorMock = MockLoginInteractor()
        routerMock = MockLoginRouter()
        presenter = LoginPresenter()
        presenter.view = viewMock
        presenter.interactor = interactorMock
        presenter.router = routerMock
    }

    override func tearDown() {
        presenter = nil
        viewMock = nil
        interactorMock = nil
        routerMock = nil
        super.tearDown()
    }

    func testLoginInitiatesLoading() {
        presenter.login(username: "test", password: "password", keepLogin: true)
        XCTAssertTrue(viewMock.isLoading)
    }

    func testLoginCallsInteractorWithCorrectCredentials() {
        presenter.login(username: "testUser", password: "1234", keepLogin: false)
        XCTAssertEqual(interactorMock.receivedUsername, "testUser")
        XCTAssertEqual(interactorMock.receivedPassword, "1234")
        XCTAssertFalse(interactorMock.keepLogin)
    }

    func testLoginSucceededStopsLoadingAndNavigates() {
        presenter.loginSucceeded()
        XCTAssertFalse(viewMock.isLoading)
        XCTAssertTrue(routerMock.isMovieHomePresented)
    }

    func testLoginFailedStopsLoadingAndShowsError() {
        let errorMessage = "Login failed"
        presenter.loginFailed(error: errorMessage)
        XCTAssertFalse(viewMock.isLoading)
        XCTAssertEqual(routerMock.receivedError, errorMessage)
    }
}
