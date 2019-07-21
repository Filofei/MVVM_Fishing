//
//  InventoryViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift
import Bond

class InventoryViewModel: InventoryViewModelType {
    
    // MARK: Properties
    
    private let realm = try! Realm()
    
    internal var selectedIndexPath: IndexPath?
    
    internal var tackleStatus: Observable<String> {
        print("\(#function) triggered")
        return Observable<String>(self.stringForTackleStatus(currentTackle?.complete))
    }
    
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
    
    func showPickerView(in controller: UIViewController, for type: ItemType.Type) {
        let alert = UIAlertController(style: .alert, title: "Выберите элемент снасти", message: InventoryTypes.name[InventoryTypes.types.firstIndex{$0 == type} ?? 0])
        
        // ADD CURRENT TYPE
        let items = getStoredItems(type: type)
        let pickerViewValues: [[String]] = [convertStoredItems(items: items)]
        let pickerViewSelectedValue: PickerViewViewController.Index = (column: 0, row: 0)
        let action = UIAlertAction(title: "Готово", style: .default) { _ in
            self.currentTackle?.checkCompletion()
        }
        alert.addPickerView(values: pickerViewValues, initialSelection: pickerViewSelectedValue) { vc, picker, index, values in
            self.updateTackleElement(items: items, index: index.row)
        }
        alert.addAction(action)
        alert.show(in: controller)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    /// This method fetches the stored in Realm elements of the tackle.
    
    func getStoredItems(type: ItemType.Type) -> [ItemType?] {
        var array: [Object?] = []
        array.append(nil)
        array += Array(realm.objects(type as! Object.Type))
        return (array as! [ItemType?])
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

    func updateTackleElement(items: [ItemType?], index: Int) {
        
        try! realm.write {
            switch selectedIndexPath?.row {
            case 0:
                currentTackle?.rod = items[index] as? Rod
            case 1:
                currentTackle?.reel = items[index] as? Reel
            case 2:
                currentTackle?.line = items[index] as? Line
            case 3:
                currentTackle?.hook = items[index] as? Hook
            case 4:
                currentTackle?.bait = items[index] as? Bait
            default:
                print("The developer fucked up.")
                fatalError(FatalErrorMessages.Inventory.saveItemTypeError.rawValue)
            }
        }
    }
    
    func stringForTackleStatus(_ status: Bool?) -> String {
        var initialString = "Снасть не готова"
        if let status = status {
            if status == true {initialString = "Снасть готова"}
        }
        return initialString
    }
}
