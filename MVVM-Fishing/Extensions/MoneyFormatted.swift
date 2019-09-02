//
//  MoneyFormatted.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 31.07.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

extension Int {
    
    /// Formats given Int as game currency
    
    func formatAsMoney() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.usesGroupingSeparator = true
        return (formatter.string(from: NSNumber(value: self)) ?? "Null") + "₽"
    }
}
