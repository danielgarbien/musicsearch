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
    
    func platformSearchEngines(for term: String) -> [PlatformSearch] {
        return platforms.map {
            $0.platformSearch(for: term)
        }
    }
}

extension SearchEngine {
    
    func platformSearchEnginesLoading(for term: String, didChange: @escaping (PlatformSearch) -> Void) -> [PlatformSearch] {
        let engines = platformSearchEngines(for: term)
        engines.forEach {
            $0.loadAll(didChange: didChange)
        }
        return engines
    }
}
