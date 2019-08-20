//
//  StoreTableViewCellViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation
import RealmSwift

class TableViewCellViewModel: StoreTableViewCellViewModelType {
    
    private var items: ItemType
    
    let realm = try! Realm()
    
    var imagePath: String {
        return items.imagePath
    }
    
    var price: String {
        return items.price.formatAsMoney()
    }
    
    var alreadyExists: Bool {
        if realm.object(ofType: type(of: items) as! Object.Type, forPrimaryKey: items.id) != nil {
            return true
        } else {
            return false
        }
    }
    
    var name: String {
        return items.name
    }
    
    var value: String {
        return items.formatValue()
    }
    
    init(items: ItemType) {
        self.items = items
    }
}
