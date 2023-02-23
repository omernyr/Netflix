//
//  Movie.swift
//  Netflix Clone
//
//  Created by macbook pro on 20.02.2023.
//

import Foundation


struct TrendingTitleResponse: Codable {
    var results: [Title]
}

struct Title: Codable {
    var id: Int?
    var original_name: String?
    var original_title: String?
    var poster_path: String?
    var media_type: String?
    var overview: String?
    var vote_count: Int?
    var release_date: String?
    var vote_average: Double?
}
