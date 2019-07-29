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
        
    var currentItem: ItemType?
    
    var name: String {
        return currentItem?.name ?? InventoryTypes.name[index]
    }
    
    var value: String {
        return currentItem?.formattedValue() ?? ""
    }
    
    var image: UIImage? {
        return UIImage(named: currentItem?.imagePath ?? "") ?? InventoryTypes.images[index]
    }
    
    init(index: Int) {
        self.index = index
    }
    
}
