//
//  PondMenuTableViewCellViewModel.swift

import Foundation

class PondMenuTableViewCellViewModel: PondMenuTableViewCellViewModelType {
    
    // MARK: Properties
    
    var index: Int
    
    var currentBase: Base?

    var locationName: String {
        return currentBase?.locations[index].name ?? ""
    }

    // MARK: Initializers
    
    init(index: Int) {
        self.index = index
    }
    
    // MARK: Methods

}
