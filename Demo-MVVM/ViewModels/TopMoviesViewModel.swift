//
//  TopMoviesViewModel.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import Foundation

protocol TopMoviesViewModelProtocol {
    
    var movieDidChange: ((Bool, Bool) -> Void)? { get set }
    func fetchMovieList()
}

class TopMoviesViewModel: TopMoviesViewModelProtocol {
        
    var movieDidChange: ((Bool, Bool) -> Void)?
    
    var movies: [Movie]? {
        didSet {
            self.movieDidChange!(true, false)
        }
    }
        
    func fetchMovieList() {
        self.movies = [Movie]()
        
        TopMovieAPIService.instance.fetchMovies { result in
            switch result {
                
            case .success(let data):
                let mappedModel = try? JSONDecoder().decode(MovieResponseModel.self, from: data) as MovieResponseModel
                self.movies = mappedModel?.movie ?? []
                break
                
            case .failure(let error):
                fatalError(error.description)
            }
        }
    }
}
