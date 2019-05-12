//
//  Rod.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

/// A struct that represents a rod which can be purchased in the store and kept in the inventory.

class Rod: Object, ItemType, Breakable {
    
    @objc dynamic var id: String = ""
    @objc dynamic var premium: Bool = false
    @objc dynamic var price: Int = 0
    @objc dynamic var imagePath: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var state: Float = 0.0
    /// Represents the maximum weight of the fish that the rod can handle.
    @objc dynamic var value: Float = 0.0
    
    convenience init(premium: Bool, price: Int, imagePath: String, name: String, state: Float, value: Float) {
        self.init()
        self.premium = premium
        self.price = price
        self.imagePath = imagePath
        self.name = name
        self.state = state
        self.value = value
        self.id = "id_\(name)"
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}

