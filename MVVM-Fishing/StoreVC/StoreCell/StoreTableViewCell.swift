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
        didSet {
            itemImageView.backgroundColor = .gray
            itemImageView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    weak var viewModel: StoreTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            DispatchQueue.main.async {
                self.itemImageView.image = UIImage(named: viewModel.imagePath)
            }
            nameLabel.text = viewModel.name
            propertyLabel.text = viewModel.value
            priceLabel.text = viewModel.price
        }
    }
}
