//
//  MovieDetailProtocol.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

protocol MovietDetailPresenterProtocol: AnyObject {
    
    var router: MovieDetailRouterProtocol? {get set}
    var view: MovieDetailViewProtocol? {get set}
    
    func viewDidLoad()
    
}

protocol MovieDetailViewProtocol: AnyObject {
    func showMovieDetail(with movie: MovieEntity)
}

protocol MovieDetailRouterProtocol: AnyObject {
    static func createMovieDetailModule(with movie: MovieEntity) -> UIViewController
}
