//
//  RodsData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

struct RodsData {
    // TODO: Remove image placeholders
    private init(){}
    
    /// Array containing rods data to be purchased in the store and kept in the inventory.
    static let rods: [Rod] = [
        Rod(premium: false, price: 100, imagePath: "", name: "Бамбуковая", state: 1.0, value: 5),
        Rod(premium: false, price: 600, imagePath: "", name: "Лёгкая", state: 1.0, value: 15),
        Rod(premium: false, price: 3500, imagePath: "", name: "Хорошая", state: 1.0, value: 40),
    ]
}
