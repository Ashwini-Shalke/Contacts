//
//  File.swift
//  Contacts
//
//  Created by Ashwini shalke on 27/07/19.
//  Copyright © 2019 Ashwini shalke. All rights reserved.
//

import Foundation
import UIKit

class TableView : UITableViewController {
    
    let cellId = "cell"
    
    let twoDimensionalArray = [
        ["Ashwini","Anil","Anita","Amar"],
        ["Babu","Birbal","Basu"],
        ["Chirag","Chintu","Chandani","Chatur","Chetan"]
    ]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "Header"
        label.backgroundColor = UIColor.blue
        return label
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       return  twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimensionalArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = twoDimensionalArray[indexPath.section][indexPath.row]
        return cell
        
    }
    
}
