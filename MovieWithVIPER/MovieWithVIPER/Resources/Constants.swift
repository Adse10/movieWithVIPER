//
//  Constants.swift
//  MovieWithVIPER
//
//  Created by Adrián Bolaños Ríos on 20/04/2021.
//

import Foundation

struct Constants {
    
    static let apiKey = "?api_key=7c17e249f082339ceece637f3e8f66e7"
    
    struct URL {
        static let base = "https://api.themoviedb.org/"
        static let baseImages = "https://image.tmdb.org/t/p/w200"
    }
    
    struct Endpoints{
        static let movieList = "3/movie/popular"
        static let movieDetail = "3/movie/"
    }
}
