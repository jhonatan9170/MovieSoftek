//
//  LoginPresenterTests.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import XCTest
@testable import MovieSoftek

class LoginPresenterTests: XCTestCase {
    var sut: LoginPresenter!
    var viewMock: LoginViewMock!
    var interactorMock: MockLoginInteractor!
    var routerMock: MockLoginRouter!
    var dispatchQueueMock:DispatchQueueType!

    override func setUp() {
        super.setUp()
        viewMock = LoginViewMock()
        interactorMock = MockLoginInteractor()
        routerMock = MockLoginRouter()
        dispatchQueueMock = DispatchQueueMock()
        sut = LoginPresenter(interactor: interactorMock, router: routerMock,mainDispatchQueue: dispatchQueueMock)
        sut.setViewProtocol(view: viewMock)
    }

    override func tearDown() {
        sut = nil
        viewMock = nil
        interactorMock = nil
        routerMock = nil
        dispatchQueueMock = nil
        super.tearDown()
    }

    func testLoginInitiatesLoading() {
        sut.login()
        XCTAssertTrue(viewMock.isLoading)
    }

    func testLoginCallsInteractorWithCorrectCredentials() {
        sut.setData(username: "testUser", password: "1234", keepLogin: false)
        sut.login()
        XCTAssertEqual(interactorMock.receivedUsername, "testUser")
        XCTAssertEqual(interactorMock.receivedPassword, "1234")
        XCTAssertFalse(interactorMock.keepLogin)
    }

    func testLoginSucceededStopsLoadingAndNavigates() {
        sut.loginSucceeded()
        XCTAssertFalse(viewMock.isLoading)
        XCTAssertTrue(routerMock.isMovieHomePresented)
    }

    func testLoginFailedStopsLoadingAndShowsError() {
        let errorMessage = "Login failed"
        sut.loginFailed(error: errorMessage)
        XCTAssertFalse(viewMock.isLoading)
        XCTAssertEqual(routerMock.receivedError, errorMessage)
    }
}
