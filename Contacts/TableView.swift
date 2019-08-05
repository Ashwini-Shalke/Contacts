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
    
    var twoDimensionalArray = [
        ["Ashwini","Anil","Anita","Amar"],
        ["Babu","Birbal","Basu"],
        ["Chirag","Chintu","Chandani","Chatur","Chetan"],
        ["Dhiraj","Deepika","Dhanu","Dhanshree"],
        ["Manu","Monika","Mansi"]
    ]
    
    var showIndexPath = false
    
    @objc func handleShowIndexPath() {
        var indexpathToReload = [IndexPath]()
        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].indices{
                let indexPath = IndexPath(row: row, section: section)
                indexpathToReload.append(indexPath)
            }
        }
        
        showIndexPath = !showIndexPath
        let animationStyle = showIndexPath ? UITableView.RowAnimation.right : .left
        tableView.reloadRows(at: indexpathToReload, with: animationStyle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ShowIndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
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
        for row in twoDimensionalArray[section].indices{
           let indexpath = IndexPath(row: row, section: section)
            indexPaths.append(indexpath)
        }
        twoDimensionalArray[section].removeAll()
        tableView.deleteRows(at: indexPaths, with: .fade)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
       return  twoDimensionalArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimensionalArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let name :String = twoDimensionalArray[indexPath.section][indexPath.row]
        
        if (showIndexPath) {
            cell.textLabel?.text = "\(name)   Section \(indexPath.section)   Row \(indexPath.row)"
        }
        else {
            cell.textLabel?.text = name
        }
        
        return cell
        
    }
    
}
