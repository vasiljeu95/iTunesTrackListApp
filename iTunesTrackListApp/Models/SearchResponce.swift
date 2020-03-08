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
    var results: [Track]
}

struct Track: Decodable {
    var trackName, artistName, collectionName: String?
    var artworkUrl100: String?
}

