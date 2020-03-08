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
                let tracksProperty = try JSONDecoder().decode(SearchResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(tracksProperty)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
