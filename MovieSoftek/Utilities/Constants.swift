//
//  Constants.swift
//  MovieSoftek
//
//  Created by Jhonatan chavez chavez on 11/11/23.
//

import Foundation

class Constants {
    
    //URL
    
    static let baseURL = "https://api.themoviedb.org/3/movie"
    static let baseImageURL = "https://image.tmdb.org/t/p/"
    static let baseImageURL200 = "https://image.tmdb.org/t/p/w200"
    static let baseImageURL500 = "https://image.tmdb.org/t/p/w200"

    static let getMoviesByPageURL = baseURL + "/upcoming?page="
    
    static let authorizacionKey = "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNTllZTZiMmU0NDIwZDNjZmNhOTYwZThlMGM1ZWFlZiIsInN1YiI6IjY1NGZlMjczZWE4NGM3MDEzOWEwYzVmYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hHDNjH6Twx2qQwiLZznmvdAZLIYaXArQTwnxyQjCIkA"
    
    
    //keys
    
    static let keepLoginKey = "keepLoginKey"
    
}
