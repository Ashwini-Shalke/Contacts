//
//  ExpandableNames.swift
//  Contacts
//
//  Created by Ashwini shalke on 06/08/19.
//  Copyright © 2019 Ashwini shalke. All rights reserved.
//

import Foundation
import UIKit
import Contacts

struct ExpandNames {
    var isExpanded: Bool
    var expnadNames : [FavoriteContact]
}

struct FavoriteContact {
    var isFav : Bool
    var favContactsName : CNContact
}
