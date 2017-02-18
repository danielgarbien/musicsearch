//
//  ResultsDataSource.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import UIKit

class ResultsDataSource: NSObject {

    init(results: [Result]) {
        self.results = results
    }
    
    fileprivate let results: [Result]
}

extension ResultsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ResultCell = tableView.dequeueReusableCellRegisterNibIfNeeded()!
        cell.configure(with: results[indexPath.row])
        return cell
    }
}
