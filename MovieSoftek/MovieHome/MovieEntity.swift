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

}

extension MovieEntity{

    func toMovieData()->MovieData {
        let movieData = MovieData()
        movieData.id = Int64( self.id)
        movieData.title =  self.title
        movieData.overview = self.overview
        movieData.releaseDate =  self.releaseDate
        return movieData
    }
}

extension MovieEntity:Equatable{
}
