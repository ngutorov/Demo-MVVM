//
//  TopMoviesAPIService.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import Foundation

class TopMovieAPIService: NSObject, Requestable {
    
    static let instance = TopMovieAPIService()
    public var movies: [Movie]?
    
    func fetchMovies(callback: @escaping Handler) {
        
        request(method: .get, url: Domain.baseUrl() + APIEndpoint.movies) { (result) in
            
            callback(result)
        }
    }
}
