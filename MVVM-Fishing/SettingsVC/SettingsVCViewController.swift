//
//  SettingsVCViewController.swift

import UIKit

class SettingsVCViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var tablewView: UITableView!
    var viewModel: SettingsVCViewModel?

    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tablewView.delegate = self
        tablewView.dataSource = self
    }
    
    // MARK: Public methods
    
    // MARK: Internal methods
    
    // MARK: Private methods

}
