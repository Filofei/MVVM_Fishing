//
//  SettingsViewController.swift

import UIKit

class SettingsViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var tablewView: UITableView!
    var viewModel: SettingsViewModel?

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
