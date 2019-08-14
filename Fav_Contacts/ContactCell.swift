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
    
    var link:TableView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let starButton = UIButton(type: .system)
        starButton.setImage(UIImage(imageLiteralResourceName: "fav_star"), for: .normal)
        starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        accessoryView = starButton
        starButton.tintColor = UIColor.blue
        starButton.addTarget(self, action: #selector(handleFav), for: .touchUpInside)
    }
    
    
    @objc func handleFav(){
        link?.handleStarExecution(cell: self)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
