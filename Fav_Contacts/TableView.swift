//
//  File.swift
//  Contacts
//
//  Created by Ashwini shalke on 27/07/19.
//  Copyright © 2019 Ashwini shalke. All rights reserved.
//

import Foundation
import UIKit
import Contacts



class TableView : UITableViewController {
    
    
    let cellId = "cell"
    // var tableView = UITableView()
    
    func handleStarExecution(cell : UITableViewCell) {
        guard let cellTapped = tableView.indexPath(for: cell) else { return}
        let contactName = twoDimensionalArray[cellTapped.section].expnadNames[cellTapped.row]
        let hasFavorited = contactName.isFav
        twoDimensionalArray[cellTapped.section].expnadNames[cellTapped.row].isFav = !hasFavorited
        tableView.reloadRows(at: [cellTapped], with: .fade)
        
        
    }
    
    
    var twoDimensionalArray = [ExpandNames]()
    //    var twoDimensionalArray = [
    //        ExpandNames(isExpanded: true, names: ["Ashwini","Anil","Anita","Amar"].map {FavoriteContact(IsFav: false, names: $0)}),
    //        ExpandNames(isExpanded: true, names: ["Babu","Birbal","Basu"].map{FavoriteContact(IsFav: false, names: $0)}),
    //        ExpandNames(isExpanded: true, names: ["Chirag","Chintu","Chandani","Chatur","Chetan"].map {FavoriteContact(IsFav: false, names: $0)}),
    //        ExpandNames(isExpanded: true, names: ["Dhiraj","Deepika","Dhanu","Dhanshree"].map{ FavoriteContact(IsFav: false, names: $0)})
    //    ]
    //
    
    private func fetchContacts(){
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print ("Failed to fetch contacts")
                return
            }
            
            if granted {
                print ("Access granted")
                let keys =  [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do {
                    var favoriteContacts = [FavoriteContact]()
                    try store.enumerateContacts(with: request, usingBlock: { (contact,stopPointerIfYouwantToStopEnumeration) in
                        print (contact.givenName)
                        print(contact.familyName)
                        print(contact.phoneNumbers.first?.value.stringValue ?? " ")
                        // favoriteContacts.append(FavoriteContact(IsFav: false, names: contact.givenName + " " + contact.familyName))
                        favoriteContacts.append(FavoriteContact(isFav : false, favContactsName : contact))
                    })
                    
                    let expandNames =  ExpandNames(isExpanded: true, expnadNames: favoriteContacts)
                    self.twoDimensionalArray = [expandNames]
                } catch let err {
                    print ("Failed to enumerateconatcts", err)
                }
                
            } else {
                print ("Access denied")
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ShowIndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ContactCell.self, forCellReuseIdentifier: cellId)
        fetchContacts()
        
    }
    var showIndexPath = false
    
    @objc func handleShowIndexPath() {
        var indexpathToReload = [IndexPath]()
        for section in twoDimensionalArray.indices {
            for row in twoDimensionalArray[section].expnadNames.indices{
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
        for row in twoDimensionalArray[section].expnadNames.indices{
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
            return twoDimensionalArray[section].expnadNames.count
        } else {
            return 0
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ContactCell
        let cell = ContactCell(style: .subtitle, reuseIdentifier: cellId)
        cell.link = self
        let contactDisplayName = twoDimensionalArray[indexPath.section].expnadNames[indexPath.row]
        cell.accessoryView?.tintColor = contactDisplayName.isFav ? UIColor.red : .lightGray
        cell.textLabel?.text = contactDisplayName.favContactsName.givenName + " " +  contactDisplayName.favContactsName.familyName
        cell.detailTextLabel?.text = contactDisplayName.favContactsName.phoneNumbers.first?.value.stringValue
        if (showIndexPath) {
            cell.textLabel?.text = "\(contactDisplayName.favContactsName )   Section \(indexPath.section)   Row \(indexPath.row)"
        }
        
        return cell
    }
}
