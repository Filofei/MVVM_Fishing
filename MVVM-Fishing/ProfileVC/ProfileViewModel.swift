//
//  ProfileViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewModel {
    
    private let realm = try! Realm()
    
    func userFields() -> [UserField] {
        var output: [UserField] = []
        guard let realmUser = realm.object(ofType: User.self, forPrimaryKey: "user") else {
            return [UserField]()
        }
        
        // This (internalUser) is an awful workaround, appeared because of strange bug (I hope so) when mirror couldn't reflect values of the fetched from realm User() instance and loaded default values instead.
        
        let internalUser = User(name: realmUser.name, level: realmUser.level, currentBase: realmUser.currentBase, money: realmUser.money)
        
        let mirror = Mirror(reflecting: internalUser)
        for (_, child) in mirror.children.enumerated() {
            var element = UserField()
            if child.label == "id" {
                continue
            }
            element.propertyName = convertPropertyName(child.label)
            element.propertyValue = String(describing: child.value)
            output.append(element)
        }
        return output
    }
    
    func numberOfRows() -> Int {
        return userFields().count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ProfileTableViewCellViewModelType? {
        let userField = userFields()[indexPath.row]
        return ProfileTableViewCellViewModel(userData: userField)
    }

    private func convertPropertyName(_ name: String?) -> String {
        switch name {
        case "name":
            return "Имя игрока"
        case "level":
            return "Уровень"
        case "currentBase":
            return "Текущая база"
        case "money":
            return "Капитал"
        default:
            return "Неизвестное свойство"
        }
    }
}
