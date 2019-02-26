//
//  Base.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

/// A struct that represents a base to be visited by the player.

struct Base: ImageType, Nameable {
    
    let image: UIImage
    
    let name: String
    
    let locations: [Location]
    var priceForATicket: Int
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
