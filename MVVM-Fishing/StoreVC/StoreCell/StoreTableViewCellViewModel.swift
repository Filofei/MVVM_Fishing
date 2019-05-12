//
//  StoreTableViewCellViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

class TableViewCellViewModel: StoreTableViewCellViewModelType {
    
    private var items: ItemType
    
    var imagePath: String {
        return items.imagePath
    }
    
    var price: String {
        let rawPrice = items.price
        switch rawPrice {
        case _ where rawPrice > 1_000_000:
            return String(describing: rawPrice / 1_000_000) + "кк руб."
        case _ where rawPrice > 1_000:
            return String(describing: rawPrice / 1_000) + "к руб."
        default:
            return String(describing: rawPrice) + " руб."
        }
    }
    
    var name: String {
        return items.name
    }
    
    var value: String {
        let rawValue = Int(items.value)
        switch items {
        case _ where items is Rod:
            return String(describing: rawValue) + " кг."
        case _ where items is Reel:
            return String(describing: rawValue) + "%"
        case _ where items is Line:
            return String(describing: rawValue) + " кг."
        case _ where items is Hook:
            return String(describing: rawValue) + "%"
        case _ where items is Bait:
            return String(describing: rawValue) + " шт."
        default:
            return String(describing: rawValue)
        }
    }
    
    init(items: ItemType) {
        self.items = items
    }
}
