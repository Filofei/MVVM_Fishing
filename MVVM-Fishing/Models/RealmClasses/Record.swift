//
//  Record.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 25/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation
import RealmSwift

class Record: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var weight: Float = 0.0
    @objc dynamic var place: String = ""
    @objc dynamic var bait: String = ""
    @objc dynamic var time: String = ""

    convenience init(name: String, weight: Float, place: String, bait: String, time: String) {
        self.init()
        self.name = name
        self.weight = weight
        self.place = place
        self.bait = bait
        self.time = time
    }
}
