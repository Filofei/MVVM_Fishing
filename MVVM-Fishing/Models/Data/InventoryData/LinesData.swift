//
//  LinesData.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//


import Foundation

struct LinesData {
    // TODO: Remove image placeholders
    private init(){}
    
    /// Array containing rods data to be purchased in the store and kept in the inventory.
    static let lines: [Line] = [
        Line(premium: false, price: 50, imagePath: "", name: "Московская", state: 1.0, value: 4.5),
        Line(premium: false, price: 300, imagePath: "", name: "Hook&Rod 12", state: 1.0, value: 12)
    ]
}

