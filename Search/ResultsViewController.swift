//
//  ResultsViewController.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    let searchEngine: SearchEngine
    
    init(searchEngine: SearchEngine) {
        self.searchEngine = searchEngine
        super.init(nibName: nil, bundle: nil)
    }
    
    func search(for term: String) {
        print(term)
        platformSearchEngines = searchEngine.platformSearchEnginesLoading(for: term) { [weak self] _ in
            self?.updateView()
        }
    }
    
    func reset() {
        platformSearchEngines = []
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 244
        tableView.rowHeight = UITableViewAutomaticDimension
        edgesForExtendedLayout = []
    }
    
    @IBOutlet private weak var tableView: UITableView!
    fileprivate var dataSource: UITableViewDataSource? {
        didSet {
            tableView.dataSource = dataSource
            tableView.reloadData()
        }
    }
    
    fileprivate var platformSearchEngines: [PlatformSearch]?
}

extension ResultsViewController {
    
    func updateView() {
        guard let engines = platformSearchEngines else {
            return
        }
        let results = engines.map {
            Result(info: $0.info, state: $0.state)
        }
        dataSource = ResultsDataSource(results: results)
    }
}

extension ResultsViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        // show suggestions?
    }
}
