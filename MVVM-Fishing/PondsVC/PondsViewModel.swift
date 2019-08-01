//
//  PondsViewModel.swift

import UIKit
import RealmSwift
import Bond

class PondsViewModel: PondsViewModelType {
    
    // MARK: Properties
    
    let realm = try! Realm()
    
    var userMoney: Observable<String> {
        guard let realmUser = realm.object(ofType: User.self, forPrimaryKey: "user") else {
            return Observable<String>("Null")
        }
        return Observable<String>("У вас есть: " + realmUser.money.formatAsMoney())
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
    
    // MARK: Private methods.

}
