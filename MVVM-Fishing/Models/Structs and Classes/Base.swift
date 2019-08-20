//
//  Base.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// A struct that represents a base to be visited by the player.

struct Base {
    
    let image: UIImage?
    
    let name: String
    /// An array of all the locations of this base.
    let locations: [Location]
    /// Price per one day on the base.
    var dailyPrice: Int
    /// The minimum player's level required to visit the base.
    let levelRequired: Int
    /// The literal description of the base.
    let description: String
    /// A computed property which shows the number of locations.
    var numberOfLocations: Int {
        get {
            return locations.count
        }
    }
}
