//
//  LocationViewController.swift

import UIKit

class LocationViewController: UIViewController {

    // MARK: Properties
    
    var viewModel: LocationViewModelType?

    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = LocationViewModel()
    }
    
    // MARK: Public methods
    
    // MARK: Internal methods
    
    // MARK: Private methods

}
