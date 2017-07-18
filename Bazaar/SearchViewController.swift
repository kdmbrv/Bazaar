//
//  SearchViewController.swift
//  Bazaar
//
//  Created by Kostya Dombrovski on 7/13/17.
//  Copyright © 2017 Kostya Dombrovski. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {

	@IBOutlet weak var searchBar: UISearchBar!
	@IBOutlet weak var tableView: UITableView!
	
	var searchActive : Bool = false
	var data:[Listing] = []
	var searchResults:Array<Listing>?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		/* Setup delegates */
		tableView.delegate = self
		tableView.dataSource = self
		searchBar.delegate = self
		
		// Load sample data
		loadSampleData()
    }
	
	private func loadSampleData() {
		
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
	
	func filterContentForSearchText(searchText: String?) {
		// Filter the array using the filter method
		if searchText == nil {
			self.searchResults = nil
			return
		}
		self.searchResults = self.data.filter({( aListing: Listing) -> Bool in
			// to start, let's just search by name
			return aListing.title.lowercased().range(of: (searchText?.lowercased())!) != nil
		})
	}
	
	func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
		self.filterContentForSearchText(searchText: searchString)
		return true
	}

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if(searchActive) {
			return self.searchResults?.count ?? 0
		}
		return self.data.count;
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellIdentifier = "ListingTableViewCell"
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)! as! ListingTableViewCell;
		
		var arrayOfListings:Array<Listing>?
		if tableView == self.searchDisplayController!.searchResultsTableView {
			arrayOfListings = self.searchResults
		} else {
			arrayOfListings = self.data
		}
  
		if arrayOfListings != nil && arrayOfListings!.count >= indexPath.row
		{
			let listing = arrayOfListings![indexPath.row]
			
			cell.listingImage.image = listing.photo
			cell.listingTitle.text = listing.title
			let formatter = NumberFormatter()
			formatter.numberStyle = .currency
			cell.listingPrice.text = formatter.string(from: listing.price)
			
			if tableView != self.searchDisplayController!.searchResultsTableView {
				// load more
			}
		}
  
		if(searchActive){
			//cell.textLabel?.text = filtered[indexPath.row]
		} else {
			//cell.textLabel?.text = data[indexPath.row];
		}
		
		return cell;
	}
}
