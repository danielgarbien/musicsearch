//
//  PlatformSearch.swift
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

struct PlatformInfo {
    let name: String
}

protocol PlatformSearch: class {
    
    init(searchTerm: String)
    
    // loading
    func load(entityOfType: Entity, didChange: @escaping (PlatformSearch) -> Void)
    var state: [Entity: SearchState] { get }
    
    // info
    var info: PlatformInfo { get }
}

extension PlatformSearch {
    
    func loadAll(didChange: @escaping (PlatformSearch) -> Void) {
        state.keys.forEach {
            load(entityOfType: $0, didChange: didChange)
        }
    }
    
    func loadFailed(didChange: @escaping (PlatformSearch) -> Void) {
        for (key, value) in state {
            guard case .failed = value else {
                continue
            }
            load(entityOfType: key, didChange: didChange)
        }
    }
}
