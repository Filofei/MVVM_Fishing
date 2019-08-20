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
    
    @objc dynamic var id: String = "user"
    @objc dynamic var name: String = "Игрок 1"
    @objc dynamic var level: Int = 1
    @objc dynamic var currentBase: String = BasesData.bases[0].name
    @objc dynamic var money: Int = 1000

    convenience init(name: String, level: Int, currentBase: String, money: Int) {
        self.init()
        self.name = name
        self.level = level
        self.currentBase = currentBase
        self.money = money
    }
    
    func subtractMoney(_ money: Int) {
        guard let realm = realm else { return }
        try! realm.write {
            if money > self.money {
                fatalError(FatalErrorMessages.Realm.notEnoughMoneyError.rawValue)
            }
            self.money -= money
        }
    }
    
    func addMoney(_ money: Int) {
        guard let realm = realm else { return }
        try! realm.write {
            self.money += money
        }
    }
    
    override static func primaryKey() -> String {
        return "id"
    }
}

