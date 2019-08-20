//
//  PondMenuTableViewCell.swift

import UIKit

class PondMenuTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var locationNameLabel: UILabel!
    
    weak var viewModel: PondMenuTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            self.locationNameLabel.text = viewModel.locationName
        }
    }
}
