//
//  FatalErrorMessages.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 15/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

enum FatalErrorMessages {
    
    /// Realm errors
    
    enum Realm: String {
        case noUser = "No object of class User found."
        case notEnoughMoneyError = "Attempting to subtract money from zero."
    }
    
    /// Errors of Inventory View Controller
    
    enum Inventory: String {
        case getItemsTypeError = "The Picker View got an array of unrelated type. Check function call."
        case saveItemTypeError = "The item doesn't match any of allowed types. Check types list."
    }
    
    /// Errors of Ponds View Controller

    enum Ponds: String {
        case flowLayoutError = "The size of collection view cell is out of bounds."
    }
    
    /// Other errors
    
    enum Other {
        static let unexpectedCondition = "Unexpected condition in \(#function)."
    }

}
