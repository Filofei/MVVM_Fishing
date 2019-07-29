//
//  FatalErrorMessages.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 15/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

enum FatalErrorMessages {
    
    /// Errors of Inventory View Controller
    
    enum Inventory: String {
        case getItemsTypeError = "The Picker View got an array of unrelated type. Check function call."
        case saveItemTypeError = "The item doesn't match any of allowed types. Check types list."
    }
}
