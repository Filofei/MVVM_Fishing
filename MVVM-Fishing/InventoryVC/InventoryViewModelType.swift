//
//  InventoryViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 14/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

protocol InventoryViewModelType {
    var currentTackle: Tackle? { get set }
    var selectedSegment: Int { get set }
    var selectedIndexPath: IndexPath? { get set }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> InventoryTableViewCellViewModelType?
    func numberOfRows() -> Int
    func showPickerView(in controller: UIViewController, for type: Object.Type) -> Void
    func selectRow(atIndexPath indexPath: IndexPath)
    func getStoredItems(type: Object.Type) -> [ItemType?]
    func convertStoredItems(items: [ItemType?]) -> [String]
}
