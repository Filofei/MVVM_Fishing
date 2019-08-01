//
//  ItemTypeFormatted.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 13/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

extension ItemType {
    func formatValue() -> String {
        let rawValue = self.value
        switch self {
        case _ where self is Rod:
            return String(describing: rawValue) + " кг."
        case _ where self is Reel:
            return String(describing: rawValue) + " %"
        case _ where self is Line:
            return String(describing: rawValue) + " кг."
        case _ where self is Hook:
            return String(describing: rawValue) + " %"
        case _ where self is Bait:
            return String(describing: rawValue) + " шт."
        default:
            return String(describing: rawValue)
        }
    }
}
