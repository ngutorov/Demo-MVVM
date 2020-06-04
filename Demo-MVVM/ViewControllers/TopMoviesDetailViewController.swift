//
//  TopMoviesDetailViewController.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 4/1/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import UIKit

class TopMoviesDetailViewController: UIViewController {
    
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDescription: UITextView!
    @IBOutlet weak var movieVotesAvarage: UILabel!
    @IBOutlet weak var movieReleseDate: UILabel!
    @IBOutlet weak var movieOriginalLanguage: UILabel!
    @IBOutlet weak var movieBackDrop: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: Internal Properties
    
    var movieItem: Movie? {
        didSet {
            if let movie = movieItem {
                self.movieTitle.text = movie.title ?? ""
                self.moviePoster.setImage(withImageId: movie.posterPath ?? "", placeholderImage: UIImage(named: "imagePlaceholder")!)
                self.movieDescription.text = movie.overview ?? ""
                self.movieVotesAvarage.text = "Rating: \n\n★ \(movie.voteAverage ?? 0)"
                self.movieReleseDate.text = "Release date: \n\n\(movie.releaseDate ?? "")"
                self.movieOriginalLanguage.text = "Original language: \n\n\(movie.originalLanguage?.capitalized ?? "")"
                self.movieBackDrop.setImage(withImageId: movie.backdropPath ?? "", placeholderImage: UIImage(named: "imagePlaceholder")!)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
    }
    
    //MARK: Prepare UI
    
    func prepareUI() {
        
        prepareScrollView()
        prepareMovieTitle()
        prepareMoviePoster()
        prepareMovieDescription()
        prepareMovieVotesAvarage()
        prepareMovieReleseDate()
        prepareMovieOriginalLanguage()
        prepareMovieBackDrop()
    }
    
    func prepareScrollView() {
        scrollView.contentSize = CGSize(width: self.view.frame.width, height: 1000)
    }
    
    func prepareMoviePoster() {
        moviePoster.contentMode = .scaleAspectFill
    }
    
    func prepareMovieTitle() {
        movieTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
    }
    
    func prepareMovieDescription() {
        movieDescription.font = UIFont.systemFont(ofSize: 14.0)
        movieDescription.isEditable = false
        movieDescription.isScrollEnabled = false
        movieDescription.sizeToFit()
    }
    
    func prepareMovieVotesAvarage() {
        movieVotesAvarage.textColor = .yellow
    }
    
    func prepareMovieReleseDate() {
        
    }
    
    func prepareMovieOriginalLanguage() {
        movieOriginalLanguage.textColor = .lightGray
    }
    
    func prepareMovieBackDrop() {
        movieBackDrop.contentMode = .scaleAspectFit
    }
}
