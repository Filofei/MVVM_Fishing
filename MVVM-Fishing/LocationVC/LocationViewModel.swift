//
//  LocationViewModel.swift

import UIKit

class LocationViewModel: LocationViewModelType {
    
    // MARK: Properties
    
    var location: Location?
    
    var tackleState: TackleState
    
    var locationImage: UIImage? {
        return location?.image
    }
    
    // MARK: Initializers
    
    init(location: Location?) {
        self.tackleStatus = 
        self.location = location
    }
    
    // MARK: Public methods.
    
    // MARK: Internal methods.
    
    // MARK: Private methods.

}
