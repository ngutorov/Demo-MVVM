//
//  AppURL.swift
//  Demo-MVVM
//
//  Created by Nikolay Gutorov on 3/24/20.
//  Copyright © 2020 Nikolay Gutorov. All rights reserved.
//

import Foundation

struct Domain {
    static let dev = "http://api.themoviedb.org/"
    static let assest = "http://image.tmdb.org/t/p/w185/"
}

extension Domain {
    static func baseUrl() -> String {
        return Domain.dev
    }
}

struct APIEndpoint {
    static let movies = "3/discover/movie?api_key=fba91c81fbe15154fb733172ef515ffa&sort_by=popularity.desc"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case acceptLangauge = "Accept-Language"
}

enum ContentType: String {
    case json = "application/json"
    case multipart = "multipart/form-data"
    case ENUS = "en-us"
}
