//
//  searchViewController.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/27/21.
//

import UIKit

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        tableViewManager.changeState(States.isSearchCompleted, searchBar.text)
        reloadData()
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        tableViewManager.changeState(States.isSearchPressed)
        reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableViewManager.changeState(States.isSearchPressed)
        reloadData()
    }
}
