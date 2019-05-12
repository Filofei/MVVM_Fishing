
//
//  HooksData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

struct HooksData {
    // TODO: Remove image placeholders
    private init(){}
    
    /// Array containing rods data to be purchased in the store and kept in the inventory.
    static let hooks: [Hook] = [
        Hook(premium: false, price: 10, imagePath: "", name: "Самодельный", value: 50.0),
        Hook(premium: false, price: 25, imagePath: "", name: "Hook&Rod №14", value: 85.0)
    ]
}
