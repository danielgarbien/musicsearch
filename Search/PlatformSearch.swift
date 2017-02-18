//
//  PlatformSearch.swift
//  Search
//
//  Created by Daniel Garbień on 2/18/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import Foundation

class PlatformSearch {
    
    let platform: Platform
    let search: Search
    
    init(platform: Platform, search: Search) {
        self.platform = platform
        self.search = search
    }
}

extension Platform {
    
    func platformSearch(for term: String) -> PlatformSearch {
        return PlatformSearch(platform: self, search: search(for: term))
    }
}
