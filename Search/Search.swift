//
//  Search.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import Foundation

enum SearchState {
    case initial
    case loading
    case loaded(results: [String])
    case failed
}

enum Entity {
    case artist
    case album
    case song
    
    static let all: [Entity] = [.artist, .album, .song]
}

extension Entity {
    
    static func allEntitiesInitialState() -> [Entity: SearchState] {
        return all.reduce([Entity: SearchState](), { (result, entity) -> [Entity: SearchState] in
            var copy = result
            copy[entity] = .initial
            return copy
        })
    }
}

protocol Search: class {
    
    init(term: String)
    
    // loading
    func load(entityOfType: Entity, didChange: @escaping (Search) -> Void)
    var state: [Entity: SearchState] { get }
}

extension Search {
    
    func loadAll(didChange: @escaping (Search) -> Void) {
        state.keys.forEach {
            load(entityOfType: $0, didChange: didChange)
        }
    }
    
    func loadFailed(didChange: @escaping (Search) -> Void) {
        for (key, value) in state {
            guard case .failed = value else {
                continue
            }
            load(entityOfType: key, didChange: didChange)
        }
    }
}
