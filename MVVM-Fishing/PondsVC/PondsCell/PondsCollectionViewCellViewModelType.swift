//
//  PondsCollectionViewCellViewModelType.swift

import UIKit

protocol PondsCollectionViewCellViewModelType: class {
    
    var index: Int { get set }
    var baseName: String { get }
    var baseImage: UIImage { get }
    var baseDescription: String { get }
    var basePrice: String { get }
    var baseMinimumLevel: String { get }
    var numberOfLocationsOnBase: String { get }
}
