//
//  NetworkService.swift
//  iTunesTrackListApp
//
//  Created by Stepan Vasilyeu on 3/9/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import Foundation

class NetworkService {
    
    func fetchTrack(searchTraks: String, completion: @escaping (SearchResponse?) -> Void) {
        
        let jsonUrl = "https://itunes.apple.com/search?term=\(searchTraks)&limit=25"
        
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let _ = try JSONDecoder().decode(Track.self, from: data)
                DispatchQueue.main.async {
//                    let trackName = tracksProperty.trackName
//                    let artistName = tracksProperty.artistName
//                    let collectionName = tracksProperty.collectionName
//                    let imageIcon = tracksProperty.artworkUrl100
//
//                    self.trackNameLabel.text = ("\(trackName ?? "Unknown")")
//                    self.artistNameLabel.text = ("\(artistName ?? "Unknown")")
//                    self.collectionNameLabel.text = ("\(collectionName ?? "Unknown")")
//                    self.trackImageView.setImage(imageURL: imageIcon)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
