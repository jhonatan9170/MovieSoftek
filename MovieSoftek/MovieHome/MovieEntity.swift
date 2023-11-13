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

extension MovieEntity:Equatable{
}
