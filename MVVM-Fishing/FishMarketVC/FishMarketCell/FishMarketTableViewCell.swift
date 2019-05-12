//
//  FishMarketTableViewCell.swift

import UIKit

class FishMarketTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    /* Sample property:
     
    @IBOutlet weak var label: UILabel!
     
    */
    
    weak var viewModel: FishMarketTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            /* Bind your FishMarketCellViewModel properties to to this FishMarketTableViewCell outlets.
 
            #EXAMPLE: self.label.text = viewModel.name
 
            */
        }
    }
}
