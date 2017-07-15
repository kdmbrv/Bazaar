//
//  SearchViewController.swift
//  Bazaar
//
//  Created by Kostya Dombrovski on 7/13/17.
//  Copyright © 2017 Kostya Dombrovski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	var searchActive : Bool = false
	var data:[String] = []
	var filtered:[String] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()

		/* Setup delegates */
		tableView.delegate = self
		tableView.dataSource = self
		searchBar.delegate = self
		
    }
	
	func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
		searchActive = true;
	}
	
	func searchBarTextDidEndEditing(searchBar: UISearchBar) {
		searchActive = false;
	}
	
	func searchBarCancelButtonClicked(searchBar: UISearchBar) {
		searchActive = false;
	}
	
	func searchBarSearchButtonClicked(searchBar: UISearchBar) {
		searchActive = false;
	}
	
	func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
		
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if(searchActive) {
			return filtered.count
		}
		return data.count;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! as UITableViewCell;
		if(searchActive){
			cell.textLabel?.text = filtered[indexPath.row]
		} else {
			cell.textLabel?.text = data[indexPath.row];
		}
		
		return cell;
	}
}
