//
//  RootViewController.swift
//  Search
//
//  Created by Daniel Garbień on 2/5/17.
//  Copyright © 2017 Daniel Garbień. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addImmediately(childController: childNavigationController, embeddedIn: view)
    }

    private lazy var resultsController: ResultsViewController = ResultsViewController()
    private lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: self.resultsController)
        searchController.searchResultsUpdater = self.resultsController
        searchController.hidesNavigationBarDuringPresentation = false
        return searchController
    }()
    
    private lazy var mainController: MainViewController = MainViewController()
    private lazy var childNavigationController: UINavigationController = {
        self.mainController.navigationItem.titleView = self.searchController.searchBar
        return UINavigationController(rootViewController: self.mainController)
    }()
}
