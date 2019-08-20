//
//  StoreViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond

protocol StoreViewModelType {
    var money: String { get set }
    var viewController: UIViewController? { get set }
    var chosenCategory: Int { get set }
    var scrollBarImages: [UIImage?] { get }
    var scrollBarText: [String] { get }
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> StoreTableViewCellViewModelType?
    func selectRow(atIndexPath indexPath: IndexPath)
    func deselectRow()
    func addToInventory(completion: () -> ())
}
