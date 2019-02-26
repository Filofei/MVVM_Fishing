//
//  FishInPond.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation
import RealmSwift

class FishInPond: Object {
    
    @objc dynamic var species: String = ""
    @objc dynamic var weight: Double = 0.0
    @objc dynamic var rare: Bool = false
    @objc dynamic var caughtOn: String = ""
    
    convenience init(species: String, weight: Double, rare: Bool, caughtOn: String) {
        self.init()
        self.species = species
        self.weight = weight
        self.rare = rare
        self.caughtOn = caughtOn
    }
}
