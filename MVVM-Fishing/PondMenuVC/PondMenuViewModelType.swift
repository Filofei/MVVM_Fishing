//
//  PondMenuViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 30.07.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation
import Bond

protocol PondMenuViewModelType {
    var currentBase: Base { get }
    var selectedLocation: Location? { get set }
    var averageDepth: String? { get set }
    var selectedLocationImage: UIImage? { get set }
    var numberOfRows: Int { get }
    func selectRow(atIndexPath indexPath: IndexPath)
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PondMenuTableViewCellViewModelType?
    
}
