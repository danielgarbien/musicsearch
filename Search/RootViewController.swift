//
//  RootViewController.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    let searchEngine: SearchEngine
    
    init(searchEngine: SearchEngine) {
        self.searchEngine = searchEngine
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addImmediately(childController: childNavigationController, embeddedIn: view)
    }

    fileprivate lazy var resultsController: ResultsViewController = ResultsViewController(searchEngine: self.searchEngine)
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: self.resultsController)
        searchController.searchResultsUpdater = self.resultsController
        searchController.searchBar.delegate = self
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    private lazy var mainController: MainViewController = MainViewController()
    private lazy var childNavigationController: UINavigationController = {
        self.mainController.navigationItem.titleView = self.searchController.searchBar
        self.mainController.definesPresentationContext = true
        return UINavigationController(rootViewController: self.mainController)
    }()
}

extension RootViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {
            return
        }
        resultsController.search(for: text)
    }
}
