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
    private var user: User?
    
    func userFields() -> [UserField] {
        var output: [UserField] = []
        guard let user = realm.object(ofType: User.self, forPrimaryKey: "user") else {
            return [UserField]()
        }
        let mirror = Mirror(reflecting: user)
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
