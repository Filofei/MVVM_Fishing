//
//  ProfileTableViewCellViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 12/04/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

class ProfileTableViewCellViewModel: ProfileTableViewCellViewModelType {
    
    private var userData: UserField
    
    var propertyName: String {
        return userData.propertyName ?? "TableViewCellVM Error"
    }
    
    var propertyValue: String {
        return userData.propertyValue ?? "TableViewCellVM Error"
    }
        
    init(userData: UserField) {
        self.userData = userData
    }
}
