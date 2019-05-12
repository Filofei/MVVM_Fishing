//
//  ProfileTableViewCellViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 12/04/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

protocol ProfileTableViewCellViewModelType: class {
    var propertyName: String { get }
    var propertyValue: String { get }
}
