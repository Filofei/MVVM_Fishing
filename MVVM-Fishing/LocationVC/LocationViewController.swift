//
//  LocationViewController.swift

import UIKit

class LocationViewController: UIViewController {

    // MARK: Properties
    
    var viewModel: LocationViewModelType?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var topView: TransparentTopView!

    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setAppearance()
        updateUI()
    }
    
    func initialize() {
        topView.parentViewController = self
    }
    
    // MARK: Public methods
    
    // MARK: Internal methods
    
    // MARK: Private methods

}
