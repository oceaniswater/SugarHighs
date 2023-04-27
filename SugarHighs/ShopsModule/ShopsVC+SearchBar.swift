//
//  ShopsVC+SearchBar.swift
//  SugarHighs
//
//  Created by Mark Golubev on 27/04/2023.
//

import Foundation
import UIKit

// MARK: - UISearchBarDelegate
extension ShopsViewController: UISearchBarDelegate {
    
    func setupSearchBar() {
        self.searchBar.delegate = self
        self.searchBar.showsCancelButton = true
        self.searchBar.showsSearchResultsButton = false
        
    }
    

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
    }
    
    // use this method to update(filter) table when you type the text and refresh when delete all of symbols
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            self.presenter.getShops()
        } else {
            self.presenter.getFilteredShops(name: searchText)
        }
    }
    
    // refresh table when you pressed cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.text = ""
        self.presenter.getShops()
        DispatchQueue.main.async {
            searchBar.resignFirstResponder()
        }
        
    }
}
