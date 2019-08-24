//
//  PondMenuViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond
import RealmSwift

class PondMenuViewModel: PondMenuViewModelType {
        
    private let realm = try! Realm()
    
    private var selectedIndexPath: IndexPath? {
        willSet {
            self.selectedLocation = currentBase.locations[newValue?.row ?? 0]
        }
    }

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
    
    var selectedLocation: Location? = nil {
        willSet {
            self.averageDepth = "Средняя глубина: \(String(newValue?.averageDepth ?? 0)) см"
            self.selectedLocationImage = newValue?.image
        }
    }

    var averageDepth: String?
    
    var selectedLocationImage: UIImage?
    
    var numberOfRows: Int {
        return currentBase.locations.count
    }
    
    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PondMenuTableViewCellViewModelType? {
        let cellViewModel: PondMenuTableViewCellViewModelType?
        
        cellViewModel = PondMenuTableViewCellViewModel(index: indexPath.row)
        
        return cellViewModel
    }
    
}
