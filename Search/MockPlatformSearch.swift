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
    
    func load(entityOfType: Entity, didChange: (PlatformSearch) -> Void) {
        state[entityOfType] = .loaded(results: [""])
        didChange(self)
    }
    
    var info: PlatformInfo {
        return PlatformInfo(name: "Mock")
    }
}


