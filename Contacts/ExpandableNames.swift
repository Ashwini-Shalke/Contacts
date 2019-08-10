//
//  ExpandableNames.swift
//  Contacts
//
//  Created by Ashwini shalke on 06/08/19.
//  Copyright © 2019 Ashwini shalke. All rights reserved.
//

import Foundation
import UIKit

struct ExpandNames {
    var isExpanded: Bool
    var names : [Contact]
}

struct Contact {
    var IsFav : Bool
    var names : String
}
