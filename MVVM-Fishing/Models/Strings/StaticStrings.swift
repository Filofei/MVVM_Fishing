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
    
    enum StoreVM {
        static let purchaseSuccess = ("Ура!","Поздравляем с покупкой!")
        static let alreadyBought = ("Хм...", "У вас уже есть такой предмет.")
        static let notEnoughMoney = ("Увы!", "Вам не хватает денег.")
    }

    enum InventoryVM {
        static let pickerViewTitle = "Выберите элемент снасти"
        static let tackleReady = "Снасть готова!"
        static let tackleNotReady = "Снасть не готова"
    }
    
    enum PondsVM {
        static let notEnoughMoney = ("Увы!", "Вам не хватает денег.")
        static let lowUserLevel = ("Увы!", "Вам не хватает опыта.")
    }
    
    static let p = ""

}
