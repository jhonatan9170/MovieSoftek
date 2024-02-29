//
//  MovieDetailProtocol.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

protocol MovietDetailPresenterProtocol: AnyObject {
    var movie: MovieEntity { get }
    func setViewProtocol(view: MovieDetailViewProtocol)
}

protocol MovieDetailViewProtocol: AnyObject {

}

protocol MovieDetailRouterProtocol: AnyObject {
    
}
