//
//  InventoryViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

class InventoryViewModel: InventoryViewModelType {
    
    // MARK: Properties
    
    private let realm = try! Realm()
    
    internal var selectedIndexPath: IndexPath?
    
    internal var selectedSegment: Int = 0 {
        willSet {
            currentTackle = realm.object(ofType: Tackle.self, forPrimaryKey: MainPrimaryKeys.tackles[newValue])
        }
    }
    
    internal var currentTackle: Tackle?
    
    // MARK: Methods
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> InventoryTableViewCellViewModelType? {
        let cellViewModel: InventoryTableViewCellViewModelType?
        
        cellViewModel = InventoryTableViewCellViewModel(index: indexPath.row)
        
        return cellViewModel
    }
    func numberOfRows() -> Int {
        return InventoryTypes.types.count
    }
    
    /// This method shows pickerview for choosing the element of the tackle.
    
    func showPickerView(in controller: UIViewController, for type: Object.Type) {
        let alert = UIAlertController(style: .alert, title: "Выберите элемент снасти", message: InventoryTypes.name[InventoryTypes.types.firstIndex{$0 == type} ?? 0])
        
        var currentType: ItemType.Type
        // ADD CURRENT TYPE
        let items = getStoredItems(type: type) as [ItemType?]
        let pickerViewValues: [[String]] = [convertStoredItems(items: items)]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: 0)
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            self.currentTackle?.checkCompletion()
        }
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            self.updateElement(items: items, index: index.row)
        }
        alert.addAction(action)
        alert.show(in: controller)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    /// This method fetches the stored in Realm elements of the tackle.
    
    func getStoredItems(type: Object.Type) -> [ItemType?] {
        var array: [ItemType?] = []
        array.append(nil)
        if type is ItemType.Type {
            array += Array(realm.objects(type)) as! [ItemType]
        } else {
            fatalError(FatalErrorMessages.Inventory.getItemsTypeError.rawValue)
        }
        return array
    }
    
    /// This method converts the values and names of the elements of the tackle into array of strings in order to be displayed in PickerView.
    
    func convertStoredItems(items: [ItemType?]) -> [String] {
        var convertedItems: [String] = []
        for (_, value) in items.enumerated() {
            if let value = value {
                convertedItems.append(value.name + " " + String(value.formattedValue()))
            } else {
                convertedItems.append("Нет")
            }
        }
        return convertedItems
    }
    
    /* #IMPORTANT: This function is not elegant and ought to be refactored! */
    
    /// This function adds selected element of the tackle to the tackle.

    func updateElement(items: [ItemType?], index: Int) {
        
    }
        
//        try! realm.write {
//            switch items[index] {
//            case let x where x is Rod?:
//                currentTackle?.rod = x as? Rod
//            case let x where x is Reel?:
//                currentTackle?.reel = x as? Reel
//            case let x where x is Line?:
//                currentTackle?.line = x as? Line
//            case let x where x is Hook?:
//                currentTackle?.hook = x as? Hook
//            case let x where x is Bait?:
//                currentTackle?.bait = x as? Bait
//            default:
//                fatalError(FatalErrorMessages.Inventory.saveItemTypeError.rawValue)
//            }
//        }
}
