

import Foundation
@testable import MovieSoftek

class MockLoginInteractor: LoginInputInteractorProtocol {
    var receivedUsername: String?
    var receivedPassword: String?
    var keepLogin: Bool = false

    func loginUser(username: String, password: String, keepLogin: Bool) {
        receivedUsername = username
        receivedPassword = password
        self.keepLogin = keepLogin
    }
    
    func setPresenterProtocol(presenter: LoginOutputInteractorProtocol) {
        
    }
}
