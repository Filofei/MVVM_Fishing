//
//  InventoryTypes.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 03/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

struct InventoryTypes {
    static let name: [String] = ["Удочка", "Катушка", "Леска", "Крючок", "Наживка", "Прочее"]
    static let names: [String] = ["Удочки", "Катушки", "Лески", "Крючки", "Наживки", "Прочее"]
    static let images: [UIImage?] = [UIImage(named: "Rod.jpg"), UIImage(named: "Reel.jpg"), UIImage(named: "Line.jpg"), UIImage(named: "Hook.jpg"), UIImage(named: "Bait.jpg"), UIImage(named: "Others.jpg")]
    static let types: [ItemType.Type] = [Rod.self, Reel.self, Line.self, Hook.self, Bait.self]
}
