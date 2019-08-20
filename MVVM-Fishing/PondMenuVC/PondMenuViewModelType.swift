//
//  PondMenuViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 30.07.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

protocol PondMenuViewModelType {
    var currentBase: Base { get }
    var numberOfRows: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PondMenuTableViewCellViewModelType?
    
}
