//
//  ItemType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

/// A protocol for all kinds of items which can be purchased in the store.

protocol ItemType {   
    /// A value, which indicates whether the item can be bought with premium currency or not.
    var premium: Bool { get }
    // TODO: ???
    var price: Int { get }
}
