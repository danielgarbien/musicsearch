//
//  MockPlatformSearch.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import Foundation

class MockPlatformSearch {
    
    let searchTerm: String
    fileprivate(set) var state: [Entity : SearchState]
    
    required init(searchTerm: String) {
        self.searchTerm = searchTerm
        state = Entity.allEntitiesInitialState()
    }
}

extension MockPlatformSearch: PlatformSearch {
    
    func load(entityOfType: Entity, didChange: @escaping (PlatformSearch) -> Void) {
        OperationQueue.main.addOperation {
            self.state[entityOfType] = .loaded(results: entityOfType.mockResults())
            didChange(self)
        }
    }
    
    var info: PlatformInfo {
        return PlatformInfo(name: "Mock")
    }
}

fileprivate extension Entity {
    
    func mockResults() -> [String] {
        switch self {
        case .artist: return ["Run the Jewels", "James Blake"]
        case .album: return ["OK Computer", "The Colour of Spring"]
        case .song: return ["Paralyzed", "I wanna be adored", "Song 2"]
        }
    }
}
