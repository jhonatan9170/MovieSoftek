//
//  MovieHomeProtocols.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import UIKit

protocol MovieHomeViewProtocol: AnyObject {
    func showMovies()
    func updateLoading(isLoading:Bool)

}

protocol MovieHomePresenterProtocol: AnyObject {
    var movies: [MovieEntity] {get set}
    func setViewProtocol(view: MovieHomeViewProtocol)
    func loadMovies()
    func movieCellAtIndex(_ index : Int) -> MovieEntity
    func showMovieSelection(with index: Int)
}

protocol MovieHomeInputInteractorProtocol: AnyObject {
    func setPresenterProtocol(presenter: MovieHomeOutputInteractorProtocol)
    func getMovieList(page:Int)
    func saveDataToStorage(movies: [MovieEntity])
}

protocol MovieHomeOutputInteractorProtocol: AnyObject {
    func moviestListDidFetch(moviesResponse: MovieListResponse)
    func moviestListDidFetchFromStorage(movies: [MovieEntity])
    func moviesListFailed(error:String)
}

protocol MovieHomeRouterProtocol: AnyObject {
    func goMovieDetail(with movie: MovieEntity)
    func showError(error: String)
}
