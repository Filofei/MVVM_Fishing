//
//  PondMenuViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

class PondMenuViewModel: PondMenuViewModelType {
    
    
    private let realm = try! Realm()
    
    var currentBase: Base {
        var output: Base = BasesData.bases[0]
        if let user = realm.object(ofType: User.self, forPrimaryKey: "user") {
            BasesData.bases.forEach {
                if $0.name == user.currentBase {
                    output = $0
                }
            }
        }
        return output
    }
    
    var numberOfRows: Int {
        return currentBase.locations.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PondMenuTableViewCellViewModelType? {
        let cellViewModel: PondMenuTableViewCellViewModelType?
        
        cellViewModel = PondMenuTableViewCellViewModel(index: indexPath.row)
        
        return cellViewModel
    }
    
}
