//
//  PondsCollectionViewCellViewModel.swift

import UIKit

class PondsCollectionViewCellViewModel: PondsCollectionViewCellViewModelType {
   
    var index: Int
    
    // MARK: Properties
    
    var baseName: String {
        return BasesData.bases[index].name
    }
    
    var baseImage: UIImage {
        return BasesData.bases[index].image
    }
    
    var baseDescription: String {
        return BasesData.bases[index].description
    }
    
    var basePrice: String {
        return "Цена за сутки: \(BasesData.bases[index].dailyPrice) руб."
    }
    
    var baseMinimumLevel: String {
        return "Мин. уровень: \(BasesData.bases[index].levelRequired)"
    }
    
    var numberOfLocationsOnBase: String {
        return "Локаций: \(BasesData.bases[index].numberOfLocations)"
    }
    
    // MARK: Initializers
    
    init(index: Int) {
        self.index = index
    }
    
    // MARK: Methods
    
}
