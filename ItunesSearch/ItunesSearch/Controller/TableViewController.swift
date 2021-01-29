//
//  TableViewController.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/27/21.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableViewManager.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "favouritesCell")
        cell.textLabel?.text = tableViewManager.getData(index: indexPath.row)
        return cell
    }
    func reloadData(){
        print("Reloading Data")
        resultTableView.reloadData()
        titleLabel.text = tableViewManager.getLabel()
    }
}
