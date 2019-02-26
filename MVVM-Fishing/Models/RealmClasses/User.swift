//
//  User.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var level: Int = 0
    @objc dynamic var currentBase: String = ""
    
    convenience init(name: String, level: Int, currentBase: String) {
        self.init()
        self.name = name
        self.level = level
        self.currentBase = currentBase
    }
}

