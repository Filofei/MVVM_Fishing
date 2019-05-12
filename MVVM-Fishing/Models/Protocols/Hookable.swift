//
//  Hookable.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

/// A protocol that represents an item which is used to hook the fish.

protocol Hookable {
    /// Determines the chance to lose the fish while pulling it out of the water. Can be from 0.0 to 1.0.
    var hookability: Float { get set }
}
