//
//  InventoryViewModelType.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 14/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift
import Bond

protocol InventoryViewModelType {
    var tackleStatus: Observable<String> { get }
    var currentTackle: Tackle? { get set }
    var selectedSegment: Int { get set }
    var selectedIndexPath: IndexPath? { get set }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> InventoryTableViewCellViewModelType?
    func numberOfRows() -> Int
    func showPickerView(in controller: UIViewController, for type: ItemType.Type) -> Void
    func selectRow(atIndexPath indexPath: IndexPath)
    func getStoredItems(type: ItemType.Type) -> [ItemType?]
    func convertStoredItems(items: [ItemType?]) -> [String]
}
