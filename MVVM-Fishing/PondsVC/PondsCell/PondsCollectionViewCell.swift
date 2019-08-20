//
//  PondsCollectionViewCell.swift

import UIKit

class PondsCollectionViewCell: UICollectionViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Cell appearance customization
        
        self.layer.cornerRadius = self.frame.width / 12
        self.layer.shadowRadius = 6
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        
    }
    
    // MARK: Properties
    
    @IBOutlet weak var baseNameLabel: UILabel!
    @IBOutlet weak var baseImageView: UIImageView! {
        willSet {
            newValue.layer.cornerRadius = newValue.frame.height / 10
        }
    }
    @IBOutlet weak var baseDescriptionTextView: UITextView! {
        willSet {
            newValue.textContainer.lineFragmentPadding = 0
        }
    }
    @IBOutlet var basePropertiesLabels: [UILabel]!
    
    weak var viewModel: PondsCollectionViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            /* Bind your PondsCollectionViewCellViewModel properties to this PondsCollectionViewCell outlets. */
 
            self.baseNameLabel.text = viewModel.baseName
            DispatchQueue.main.async {
                self.baseImageView.image = viewModel.baseImage
            }
            self.baseDescriptionTextView.text = viewModel.baseDescription
            self.basePropertiesLabels[0].text = viewModel.basePrice
            self.basePropertiesLabels[1].text = viewModel.baseMinimumLevel
            self.basePropertiesLabels[2].text = viewModel.numberOfLocationsOnBase
        }
    }
    
}
