//
//  ItemType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// A protocol for all kinds of items which can be purchased in the store.

protocol ItemType {
    var id: String { get }
    ///
    var name: String { get }
    /// A value, which indicates whether the item can be bought with premium currency or not.
    var premium: Bool { get }
    // TODO: ???
    var price: Int { get }
    /// A UIImage depicting the image of the object.
    var imagePath: String { get }
    ///
    var value: Float { get }
}
