//
//  Platform.swift
//  Search
//
//  Created by Daniel Garbień on 2/18/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import Foundation


protocol Platform {
    
    func search(for term: String) -> Search

    // info
    var info: PlatformInfo { get }
}

struct PlatformInfo {
    let name: String
}
