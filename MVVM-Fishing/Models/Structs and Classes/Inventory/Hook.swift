//
//  Hook.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

class Hook: Object, ItemType {
    
    @objc dynamic var id: String = ""
    @objc dynamic var premium: Bool = false
    @objc dynamic var price: Int = 0
    @objc dynamic var imagePath: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var value: Float = 0.0
    
    convenience init(premium: Bool, price: Int, imagePath: String, name: String, value: Float) {
        self.init()
        self.premium = premium
        self.price = price
        self.imagePath = imagePath
        self.name = name
        self.value = value
        self.id = "id_\(name)"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

