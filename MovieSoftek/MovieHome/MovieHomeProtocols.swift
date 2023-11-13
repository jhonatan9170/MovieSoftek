//
//  MovieHomeProtocols.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

protocol MovieHomeViewProtocol: AnyObject {
    func showMovies(with movies: [MovieEntity])
    func updateLoading(isLoading:Bool)

}

protocol MovieHomePresenterProtocol: AnyObject {
    var interactor: MovieHomeInputInteractorProtocol? {get set}
    var view: MovieHomeViewProtocol? {get set}
    var router: MovieHomeRouterProtocol? {get set}

    func loadMovies()
    func showMovieSelection(with movie: MovieEntity)
}

protocol MovieHomeInputInteractorProtocol: AnyObject {
    var presenter: MovieHomeOutputInteractorProtocol? {get set}
    func getMovieList(page:Int)
    func saveDataToStorage(movies: [MovieEntity])
}

protocol MovieHomeOutputInteractorProtocol: AnyObject {
    func moviestListDidFetch(moviesResponse: MovieListResponse)
    func moviestListDidFetchFromStorage(movies: [MovieEntity])
    func moviesListFailed(error:String)
}

protocol MovieHomeRouterProtocol: AnyObject {
    var viewController: UIViewController? { get set }
    static func createMovieHomeModule() -> UIViewController

    func goMovieDetail(with movie: MovieEntity)
    func showError(error: String)
}
