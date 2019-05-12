//
//  BaitsData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 05/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

struct BaitsData {
    // TODO: Remove image placeholders
    private init(){}
    
    /// Array containing rods data to be purchased in the store and kept in the inventory.
    static let baits: [Bait] = [
        Bait(premium: false, price: 30, imagePath: "", name: "Червь", value: 20.0),
        Bait(premium: false, price: 20, imagePath: "", name: "Мотыль", value: 50.0)
    ]
}
