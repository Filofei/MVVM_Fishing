//
//  StoreTableViewCellViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

protocol StoreTableViewCellViewModelType: class {
    var imagePath: String { get }
    var name: String { get }
    var price: String { get }
    var value: String { get }
}
