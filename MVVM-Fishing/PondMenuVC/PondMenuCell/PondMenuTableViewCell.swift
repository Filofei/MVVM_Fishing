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
            self.locationNameLabel.textColor = Palette.darkGreen
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        AppearanceManager.selectTableViewCell(selected, self)
    }
}
