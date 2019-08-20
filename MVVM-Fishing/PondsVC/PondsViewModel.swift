//
//  PondsViewModel.swift

import UIKit
import RealmSwift
import Bond

class PondsViewModel: PondsViewModelType {
    
    enum PurchaseOutcome {
        case notEnoughMoney
        case lowLevel
    }
    
    // MARK: Properties
    
    weak var viewController: UIViewController?
    
    let realm = try! Realm()
        
    var userMoney: String {
        var output: String = ""
        if let realmUser = realm.object(ofType: User.self, forPrimaryKey: "user") {
            output = "У вас " + realmUser.money.formatAsMoney()
        }
        return output
    }
    
    var userLevel: String {
        var output: String = ""
        if let realmUser = realm.object(ofType: User.self, forPrimaryKey: "user") {
            output = "\(realmUser.level) уровень"
        }
        return output
    }
    
    var currentBaseIndex: Int {
        let bases = BasesData.bases.enumerated()
        var value: Int = 0
        if let realmUser = realm.object(ofType: User.self, forPrimaryKey: "user") {
            bases.forEach {
                if realmUser.currentBase == $0.element.name {
                    value = $0.offset
                }
            }
        }
        return value
    }
    
    // MARK: Initializers
    
    // MARK: Public methods.
    
    // MARK: Internal methods.
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PondsCollectionViewCellViewModelType? {
        
        let cellViewModel: PondsCollectionViewCellViewModelType?
        
        cellViewModel = PondsCollectionViewCellViewModel(index: indexPath.row)
        
        return cellViewModel
    }
    
    func numberOfRows() -> Int {
        return BasesData.bases.count
    }
    
    func changeCurrentBase(toBase index: Int, completion: () -> Void) {
        guard let user = realm.object(ofType: User.self, forPrimaryKey: "user") else {
            return
        }
        let newBase = BasesData.bases[index]
        if (user.money >= newBase.dailyPrice) && (user.level >= newBase.levelRequired) {
            user.subtractMoney(newBase.dailyPrice)
            try! realm.write {
                user.currentBase = newBase.name
            }
            completion()
        } else {
            if user.money < newBase.dailyPrice {
                showAlert(.notEnoughMoney)
            } else if user.level < newBase.levelRequired {
                showAlert(.lowLevel)
            } else {
                fatalError(FatalErrorMessages.Other.unexpectedCondition)
            }
        }

    }
    
    func showAlert(_ outcome: PurchaseOutcome) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        
        switch outcome {
        case .notEnoughMoney:
            alert.title = StaticStrings.StoreVM.notEnoughMoney.0
            alert.message = StaticStrings.StoreVM.notEnoughMoney.1
        case .lowLevel:
            alert.title = StaticStrings.PondsVM.lowUserLevel.0
            alert.message = StaticStrings.PondsVM.lowUserLevel.1
        }
        
        let action = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        alert.addAction(action)
        guard let controller = viewController else {
            return
        }
        controller.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Private methods.

}
