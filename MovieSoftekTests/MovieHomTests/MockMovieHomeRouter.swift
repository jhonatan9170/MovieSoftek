//
//  MockMovieHomeRouter.swift
//  MovieSoftekTests
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit
@testable import MovieSoftek

class MockMovieHomeRouter: MovieHomeRouterProtocol {
    var viewController: UIViewController?
    
    var movieDetailEntity: MovieEntity?
    var errorShown: String?
    
    func goMovieDetail(with movie: MovieEntity) {
        self.movieDetailEntity = movie
    }
    
    func showError(error: String) {
        errorShown = error
    }
    
    
    static func createMovieHomeModule() -> UIViewController {
        return UIViewController()
    }
}
