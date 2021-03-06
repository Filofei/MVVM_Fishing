//
//  StoreViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond
import RealmSwift


class StoreViewModel: StoreViewModelType {
    
    private let realm = try! Realm()
    
    enum PurchaseOutcome {
        case success
        case notEnoughMoney
        case alreadyExists
    }
    
    weak var viewController: UIViewController?
    
    var money: String {
        get {
            let rawMoney = try! Realm().object(ofType: User.self, forPrimaryKey: "user")?.money ?? 0
            return "У вас " + rawMoney.formatAsMoney()
        }
        set {
            
        }
    }
    
    var items: [ItemType] = [] {
        didSet {
            itemNames.removeAll()
            items.forEach { (item) in
                itemNames.append(item.name)
            }
        }
    }
    var itemNames: [String] = []

    var selectedCategory: Int = 0 {
        didSet {
            switch selectedCategory {
            case 0: 
                items = RodsData.rods
            case 1:
                items = ReelsData.reels
            case 2:
                items = LinesData.lines
            case 3:
                items = HooksData.hooks
            case 4:
                items = BaitsData.baits
            default:
                items = []
            }
        }
    }
    
    var scrollBarImages: [UIImage?] = InventoryTypes.images
    var scrollBarText: [String] = InventoryTypes.names
    
    private var selectedIndexPath: IndexPath?
        
    func numberOfRows() -> Int {
        return items.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> StoreTableViewCellViewModelType? {
        let item = items[indexPath.row]
        return TableViewCellViewModel(items: item)
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func deselectRow() {
        self.selectedIndexPath = nil
    }
    
    func addToInventory(completion: () -> ()) {
            guard let indexPath = selectedIndexPath else {
                return
            }
            let item = items[indexPath.row]
            if let user = realm.object(ofType: User.self, forPrimaryKey: "user") {
                if realm.object(ofType: type(of: item) as! Object.Type, forPrimaryKey: item.id) != nil {
                    showAlert(.alreadyExists)
                } else {
                    if item.price > user.money {
                        showAlert(.notEnoughMoney)
                    } else {
                        user.subtractMoney(item.price)
                        try! realm.write {
                            realm.add(item as! Object)
                        }
                        showAlert(.success)
                }
            }
        }
        completion()
    }
    
    func showAlert(_ outcome: PurchaseOutcome) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        switch outcome {
        case .success:
            alert.title = StaticStrings.StoreVM.purchaseSuccess.0
            alert.message = StaticStrings.StoreVM.purchaseSuccess.1
        case .alreadyExists:
            alert.title = StaticStrings.StoreVM.alreadyBought.0
            alert.message = StaticStrings.StoreVM.alreadyBought.1
        case .notEnoughMoney:
            alert.title = StaticStrings.StoreVM.notEnoughMoney.0
            alert.message = StaticStrings.StoreVM.notEnoughMoney.1
        }

        let action = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alert.addAction(action)
        guard let controller = viewController else {
            return
        }
        controller.present(alert, animated: true, completion: nil)
    }
}


