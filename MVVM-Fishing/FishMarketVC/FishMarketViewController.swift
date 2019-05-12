//
//  FishMarketViewController.swift

import UIKit

class FishMarketViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    @IBOutlet weak var tablewView: UITableView!
    var viewModel: FishMarketViewModel?

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
