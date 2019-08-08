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
    
    func handleStarExecution(cell : UITableViewCell) {
        guard let cellTapped = tableView.indexPath(for: cell) else { return}
        let contactName = twoDimensionalArray[cellTapped.section].names[cellTapped.row]
        print("Selected Name \(contactName)")
    }
    
    var twoDimensionalArray = [
        Expand(isExpanded: true, names: ["Ashwini","Anil","Anita","Amar"]),
        Expand(isExpanded: true, names: ["Babu","Birbal","Basu"]),
        Expand(isExpanded: true, names: ["Chirag","Chintu","Chandani","Chatur","Chetan"]),
        Expand(isExpanded: true, names: ["Dhiraj","Deepika","Dhanu","Dhanshree"])
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ShowIndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
    }
    var showIndexPath = false
    
    @objc func handleShowIndexPath() {
        var indexpathToReload = [IndexPath]()
        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].names.indices{
                let indexPath = IndexPath(row: row, section: section)
                indexpathToReload.append(indexPath)
            }
        }
        
        showIndexPath = !showIndexPath
        let animationStyle = showIndexPath ? UITableView.RowAnimation.right : .left
        
        
        tableView.reloadRows(at: indexpathToReload, with: animationStyle)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.setTitle("Close", for: .normal)
        button.backgroundColor = UIColor.gray
        button.setTitleColor(.white, for: .selected)
        button.tag = section
        button.addTarget(self, action: #selector(handleExpand), for: .touchUpInside)
        return button
    }
    
    @objc func handleExpand(button :UIButton)
    {
        let section = button.tag
        var indexPaths = [IndexPath]()
        for row in twoDimensionalArray[section].names.indices{
            let indexpath = IndexPath(row: row, section: section)
            indexPaths.append(indexpath)
        }
        
        let isExpanded = twoDimensionalArray[section].isExpanded
        twoDimensionalArray[section].isExpanded = !isExpanded
        
        button.setTitle(isExpanded ? "Open" : "Close", for: .normal )
        
        if isExpanded {
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return  twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if twoDimensionalArray[section].isExpanded{
            return twoDimensionalArray[section].names.count
        } else {
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
        
        cell.link = self
        
        let name :String = twoDimensionalArray[indexPath.section].names [indexPath.row]
        
        if (showIndexPath) {
            cell.textLabel?.text = "\(name)   Section \(indexPath.section)   Row \(indexPath.row)"
        }
        else {
            cell.textLabel?.text = name
        }
        
        return cell
        
    }
    
}
