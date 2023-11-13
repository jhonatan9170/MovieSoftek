//
//  MovieService.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import Foundation
protocol MoviesServiceProtocol {
    func getUpcomingMovies(page: Int,completion: @escaping (MovieListResponse?) -> Void )
}

class MoviesService:MoviesServiceProtocol {
    
    var apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func getUpcomingMovies(page: Int , completion: @escaping (MovieListResponse?) -> Void ) {
        let headers = [
            "Authorization": Constants.authorizacionKey
        ]
        let url = Constants.getMoviesByPageURL + String(page)
        apiClient.request(url: url, method: .get, headers: headers, parameters: nil){(result : Result<MovieListResponse, APIClientError>) in
            switch result {
            case .success(let movies):
                completion(movies)
            case .failure(_):
                completion(nil)
            }
        }
    }
}
