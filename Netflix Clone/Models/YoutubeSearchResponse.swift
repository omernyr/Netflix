//
//  YoutubeSearchResponse.swift
//  Netflix Clone
//
//  Created by macbook pro on 25.02.2023.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    var items: [VideoElement]
}

struct VideoElement: Codable {
    var id: IDVideoElement
}

struct IDVideoElement: Codable {
    var kind: String
    var videoId: String
}
