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
        return items.price.formatAsMoney()
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
