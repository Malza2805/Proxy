//
//  SearchViewController.swift
//  Proxy
//
//  Created by Josipa Lipovac on 07/06/2018.
//  Copyright © 2018 ruaziosteam. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableSearch: UITableView!
    
    var categorieList = [Category.clothing, Category.drinks, Category.food, Category.footwear, Category.mobile, Category.sport, Category.technology, Category.misc]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorieList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath) as! SearchTableViewCell
        cell.setUpTableViewCell(category: categorieList[indexPath.row])
        return cell
    }
    
    @objc
    func searchForListing() {
        var listings: [Listing] = []
        DatabaseHelper.init().getListingsByName(name: searchTextField.text ?? "") { (response) in
            self.searchTextField.text == ""
            for json in response {
                listings.append(Listing(json: json))
            }
            let searchResultsVC = SearchResultsViewController()
            searchResultsVC.searchResults = listings
            self.navigationController?.pushViewController(searchResultsVC, animated: true)
        }
    }
    
    
    
    
    func initialSetup() {
        tableSearch.dataSource = self
        tableSearch.delegate = self
        tableSearch.estimatedRowHeight = 100
        tableSearch.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "CellIdentifier")
    }
}



