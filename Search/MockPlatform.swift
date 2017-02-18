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
    
    func search(for term: String) -> Search {
        return MockSearch(term: term)
    }
    
    var info: PlatformInfo {
        return PlatformInfo(name: "Mock")
    }
}
