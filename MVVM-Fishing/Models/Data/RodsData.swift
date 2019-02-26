//
//  RodsData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

struct RodsData {
    // TODO: Remove image placeholders
    private init(){}
    
    /// Array containing rods data to be purchased in the store and kept in the inventory.
    static let rods: [Rod] = [
        Rod(name: "Бамбуковая удочка", maxWeight: 5, premium: false, price: 100, image: UIImage(), state: 1.0),
        Rod(name: "Лёгкая удочка", maxWeight: 15, premium: false, price: 600, image: UIImage(), state: 1.0),
//        Rod(name: "Хорошая удочка", maxWeight: 30, premium: false, price: 3500, image: UIImage(), state: 1.0)
    ]
}
