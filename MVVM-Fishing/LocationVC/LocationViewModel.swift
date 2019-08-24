//
//  LocationViewModel.swift

import UIKit

class LocationViewModel: LocationViewModelType {
    
    // MARK: Properties
    
    var location: Location?
    
    var locationImage: UIImage? {
        return location?.image
    }
    
    // MARK: Initializers
    
    // MARK: Public methods.
    
    // MARK: Internal methods.
    
    // MARK: Private methods.

}
