//
//  TopMovies.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import Foundation

struct MovieResponseModel : Codable {
    
    let page : Int?
    let total_results : Int?
    let total_pages : Int?
    let movie : [Movie]?
    
    enum CodingKeys: String, CodingKey {
        
        case page = "page"
        case total_results = "total_results"
        case total_pages = "total_pages"
        case movie = "results"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total_results = try values.decodeIfPresent(Int.self, forKey: .total_results)
        total_pages = try values.decodeIfPresent(Int.self, forKey: .total_pages)
        movie = try values.decodeIfPresent([Movie].self, forKey: .movie)
    }
}

struct Movie : Codable {
    
    let vote_count : Int?
    let id : Int?
    let video : Bool?
    let vote_average : Double?
    let title : String?
    let popularity : Double?
    let poster_path : String?
    let original_language : String?
    let original_title : String?
    let genre_ids : [Int]?
    let backdrop_path : String?
    let adult : Bool?
    let overview : String?
    let release_date : String?
    
    enum CodingKeys: String, CodingKey {
        
        case vote_count = "vote_count"
        case id = "id"
        case video = "video"
        case vote_average = "vote_average"
        case title = "title"
        case popularity = "popularity"
        case poster_path = "poster_path"
        case original_language = "original_language"
        case original_title = "original_title"
        case genre_ids = "genre_ids"
        case backdrop_path = "backdrop_path"
        case adult = "adult"
        case overview = "overview"
        case release_date = "release_date"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vote_count = try values.decodeIfPresent(Int.self, forKey: .vote_count)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        video = try values.decodeIfPresent(Bool.self, forKey: .video)
        vote_average = try values.decodeIfPresent(Double.self, forKey: .vote_average)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        poster_path = try values.decodeIfPresent(String.self, forKey: .poster_path)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        original_title = try values.decodeIfPresent(String.self, forKey: .original_title)
        genre_ids = try values.decodeIfPresent([Int].self, forKey: .genre_ids)
        backdrop_path = try values.decodeIfPresent(String.self, forKey: .backdrop_path)
        adult = try values.decodeIfPresent(Bool.self, forKey: .adult)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        release_date = try values.decodeIfPresent(String.self, forKey: .release_date)
    }
}
