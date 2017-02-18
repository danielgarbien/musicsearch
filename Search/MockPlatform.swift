//
//  MockPlatform.swift
//  Search
//
//  Created by Daniel Garbień on 2/18/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import Foundation

class MockPlatform {
    
}

extension MockPlatform: Platform {
    
    func platformSearch(for searchTerm: String) -> PlatformSearch {
        return MockPlatformSearch(searchTerm: searchTerm)
    }
}
