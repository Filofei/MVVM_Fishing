//
//  InventoryTableViewCellViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 13/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

protocol InventoryTableViewCellViewModelType: class {
    var index: Int { get set }
    var name: String { get }
    var value: String { get }
    var image: UIImage? { get }
}
