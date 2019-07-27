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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    //        return 1
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = "Hey"
        return cell
        
    }
    
}
