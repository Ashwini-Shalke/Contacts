//
//  ContactCell.swift
//  Contacts
//
//  Created by Ashwini shalke on 07/08/19.
//  Copyright © 2019 Ashwini shalke. All rights reserved.
//

import Foundation

import UIKit

class ContactCell : UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       // backgroundColor = .red
        let starButton = UIButton(type: .system)
        //starButton.setTitle("Hye", for: .normal)
        starButton.setImage(UIImage(imageLiteralResourceName: "fav_star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        accessoryView = starButton
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
