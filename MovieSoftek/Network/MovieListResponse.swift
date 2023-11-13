//
//  MovieListResponse.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import Foundation

// MARK: - MovieListResponse
struct MovieListResponse: Codable {
    let page: Int
    let results: [MovieResponse]
    let totalPages: Int

    enum CodingKeys: String, CodingKey {
        case  page, results
        case totalPages = "total_pages"
    }
}

// MARK: - Dates


// MARK: - Result
struct MovieResponse: Codable {
    let id: Int
    let overview: String
    let posterPath, releaseDate, title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
    }
}
