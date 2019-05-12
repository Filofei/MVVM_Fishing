//
//  StaticStrings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 11/04/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

enum StaticStrings {
    
    enum ServiceMessages {
        static let template = ""
        static let error = "No string assigned"
        static let introMessage = """
            Это демонстрационный проект.
            Здесь нет дизайна.
            Только примеры моего кода.
            """
    }
    enum StoreVC {
        static let purchaseSuccess = ("Ура!","Поздравляем с покупкой!")
        static let alreadyBought = ("Хм...", "У вас уже есть такой предмет.")
        static let notEnoughMoney = ("Увы!", "Вам не хватает денег.")
    }
    enum Errors {
        static let outOfMoney = "The user's money is going to set below zero."
    }
    
    
    static let p = ""

}
