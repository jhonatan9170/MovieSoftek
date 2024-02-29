//
//  MovieEntity.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 13/11/23.
//

import Foundation

struct MovieEntity {
    let id: Int
    let title: String
    let rating: String
    var posterURL: URL?
    let releaseDate: String
    let overview: String

    init(id: Int, title: String, rating: String, posterURL: URL? = nil, releaseDate: String, overview: String) {
        self.id = id
        self.title = title
        self.rating = rating
        self.posterURL = posterURL
        self.releaseDate = releaseDate
        self.overview = overview
    }
    
    init(movieResponse:MovieResponse) {
        self.id = movieResponse.id
        self.title = movieResponse.title
        self.rating = String(movieResponse.voteAverage)+"/10"
        self.posterURL = URL(string: Constants.baseImageURL200 + movieResponse.posterPath)
        self.releaseDate = movieResponse.releaseDate.toLegibleDate(inputFormat: "yyyy-MM-dd") ?? movieResponse.releaseDate
        self.overview = movieResponse.overview
    }
}

extension MovieEntity:Equatable{
}
