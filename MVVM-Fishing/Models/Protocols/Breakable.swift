//
//  Breakable.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

/// A protocol that represents an item which can be broken.

protocol Breakable {
    /// Represents the state of the item. When it reaches 0.0 the item breaks and disappears.
    var state: Float { get set }
//    mutating func instantBreak()
//    mutating func spoil()
}
