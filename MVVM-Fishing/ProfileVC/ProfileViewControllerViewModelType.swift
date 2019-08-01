//
//  ProfileViewControllerViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 12/04/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

protocol ProfileViewModelType {
    func userFields() -> [UserField]
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> ProfileTableViewCellViewModelType?
}
