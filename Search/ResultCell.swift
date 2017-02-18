//
//  ResultCell.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    
    @IBOutlet weak var songsLabel: UILabel!
    @IBOutlet weak var albumsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistsLabel: UILabel!
}

extension ResultCell {
    
    func configure(with result: Result) {
        nameLabel.text = result.info.name
        
        Entity.all.forEach {
            label(for: $0).text = result.state[$0]?.description(with: $0)
        }
    }
    
    func label(for entity: Entity) -> UILabel {
        switch entity {
        case .album: return albumsLabel
        case .artist: return artistsLabel
        case .song: return songsLabel
        }
    }
}

extension SearchState {
    
    func description(with entity: Entity) -> String {
        switch self {
        case .failed: return "Failed"
        case .initial: return "Initial"
        case .loading: return "Loading"
        case .loaded(let results):
            return "\(results.count) \(entity.name())s\n" +
            "\(results.joined(separator: "\n"))"
        }
    }
}

extension Entity {
    
    func name() -> String {
        switch self {
        case .album: return "album"
        case .artist: return "artist"
        case .song: return "song"
        }
    }
}
