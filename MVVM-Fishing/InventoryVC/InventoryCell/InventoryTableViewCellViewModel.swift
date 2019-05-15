//
//  InventoryTableViewCellViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 13/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class InventoryTableViewCellViewModel: InventoryTableViewCellViewModelType {
    
    internal var index: Int
    
    var name: String {
        return InventoryTypes.name[index]
    }
    
    var value: String {
        return ""
    }
    
    var image: UIImage? {
        return InventoryTypes.images[index]
    }
    
    init(index: Int) {
        self.index = index
    }
    
}
