//
//  Line.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

class Line: Object, ItemType, Breakable {
    
    @objc dynamic var id: String = ""
    @objc dynamic var premium: Bool = false
    @objc dynamic var price: Int = 0
    @objc dynamic var imagePath: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var state: Float = 0.0
    /// Represents the maximum weight of the fish that the line can handle.
    @objc dynamic var value: Int = 0
    
    convenience init(premium: Bool, price: Int, imagePath: String, name: String, state: Float, value: Int) {
        self.init()
        self.premium = premium
        self.price = price
        self.imagePath = imagePath
        self.name = name
        self.state = state
        self.value = value
        self.id = "id_\(name)"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
