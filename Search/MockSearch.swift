//
//  MockPlatformSearch.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import Foundation

class MockSearch {
    
    let term: String
    fileprivate(set) var state: [Entity : SearchState]
    
    required init(term: String) {
        self.term = term
        state = Entity.allEntitiesInitialState()
    }
}

extension MockSearch: Search {
    
    func load(entityOfType: Entity, didChange: @escaping (Search) -> Void) {
        OperationQueue.main.addOperation {
            self.state[entityOfType] = .loaded(results: entityOfType.mockResults())
            didChange(self)
        }
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
