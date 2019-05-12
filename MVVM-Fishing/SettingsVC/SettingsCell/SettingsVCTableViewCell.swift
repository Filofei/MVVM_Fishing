//
//  SettingsVCTableViewCell.swift

import UIKit

class SettingsVCTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    /* Sample property:
     
    @IBOutlet weak var label: UILabel!
     
    */
    
    weak var viewModel: StoreTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            /* Bind your SettingsVCCellViewModel properties to to this SettingsVCTableViewCell outlets.
 
            #EXAMPLE: self.label.text = viewModel.name
 
            */
        }
    }
}
