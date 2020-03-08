//
//  TrackCell.swift
//  iTunesTrackListApp
//
//  Created by Stepan Vasilyeu on 3/8/20.
//  Copyright © 2020 Stepan Vasilyeu. All rights reserved.
//

import UIKit

class TrackCell: UITableViewCell {
    
    static let reuseId = "TrackCell"
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func set(track: Track) {
        trackNameLabel.text = track.trackName
        artistNameLabel.text = track.artistName
        collectionNameLabel.text = track.collectionName
        trackNameLabel.text = track.trackName
        trackImageView.setImage(imageURL: track.artworkUrl100)
    }
}

