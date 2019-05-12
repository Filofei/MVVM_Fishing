
//
//  ReelsData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

struct ReelsData {
    // TODO: Remove image placeholders
    private init(){}
    
    /// Array containing rods data to be purchased in the store and kept in the inventory.
    static let reels: [Reel] = [
        Reel(premium: false, price: 200, imagePath: "", name: "Инерционная катушка", value: 5.0),
        Reel(premium: false, price: 500, imagePath: "", name: "Hook&Rod 120 light", value: 10.0)
    ]
}
