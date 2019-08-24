//
//  StoreTableViewCell.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 04/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView! {
        willSet {
            newValue.backgroundColor = .lightGray
            newValue.layer.cornerRadius = newValue.frame.height / 4
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var itemExistenceIndicatorView: UIView! {
        willSet {
            newValue.layer.cornerRadius = newValue.frame.height / 2
        }
    }
    
    weak var viewModel: StoreTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            DispatchQueue.main.async {
                self.itemImageView.image = UIImage(named: viewModel.imagePath)
            }
            nameLabel.text = viewModel.name
            propertyLabel.text = viewModel.value
            priceLabel.text = viewModel.price
            UIView.animate(withDuration: 0.1) {
                self.itemExistenceIndicatorView.backgroundColor = self.colorForItemExistenceIndicator(viewModel.alreadyExists)
            }
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        AppearanceManager.selectTableViewCell(selected, self)
    }
    
    func colorForItemExistenceIndicator(_ status: Bool) -> UIColor {
        switch status {
        case true:
            return Palette.mediumGreen
        default:
            return .clear
        }
    }
}
