//
//  Nameable.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

/// A protocol for any item that can have a name.

protocol Nameable {
    
    /// A name to be displayed to user.
    var name: String { get }
}
