//
//  SearchResponce.swift
//  iTunesTrackListApp
//
//  Created by Stepan Vasilyeu on 3/8/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Foundation

struct SearchResponse: Decodable {
    var resultCount: Int
    var result: [Track]
}

struct Track: Decodable {
    var trackName: String
    var collectionName: String?
    var artistName: String
    var artworkUrl100: String?
}
