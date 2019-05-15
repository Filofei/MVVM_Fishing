//
//  InventoryTableViewCell.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 12/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Foundation

import UIKit

class InventoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    weak var viewModel: InventoryTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            valueLabel.text = viewModel.value
            cellImageView.image = viewModel.image
        }
    }
}
