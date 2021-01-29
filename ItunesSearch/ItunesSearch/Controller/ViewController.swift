//
//  ViewController.swift
//  ItunesSearch
//
//  Created by Sahil Mirchandani on 1/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var itunesSearchBar: UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    var tableViewManager: TableViewManager = TableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let itunesClient = ItunesClient()
        itunesClient.search(keyword: "high school musical", completion: {result in
            print(result.items[0])
        })
        resultTableView.dataSource = self
        resultTableView.delegate = self
        itunesSearchBar.delegate = self
    }
    @IBAction func refreshButtonPressed(_ sender: Any) {
        reloadData()
    }
}


