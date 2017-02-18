//
//  SearchEngine.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import Foundation

class SearchEngine {
    
    let platforms: [Platform] = [
        MockPlatform()
    ]
    
    func platformSearches(for term: String) -> [PlatformSearch] {
        return platforms.map {
            $0.platformSearch(for: term)
        }
    }
}

extension SearchEngine {
    
    func platformSearchesLoadingAll(for term: String, didChange: @escaping (PlatformSearch) -> Void) -> [PlatformSearch] {
        let engines = platformSearches(for: term)
        engines.forEach { engine in
            engine.search.loadAll(didChange: { _ in
                didChange(engine)
            })
        }
        return engines
    }
}
