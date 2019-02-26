//
//  Rod.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// A struct that represents a rod which can be purchased in the store and kept in the inventory.

struct Rod: ItemType, ImageType, Nameable, Breakable {
    
    var name: String
    let maxWeight: Int
    let premium: Bool
    var price: Int
    let image: UIImage
    
    var state: Float
}

