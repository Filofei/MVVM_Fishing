//
//  ProfileTableViewCell.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 12/04/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var propertyLabel: UILabel!
    @IBOutlet weak var propertyValueLabel: UILabel!
    
    weak var viewModel: ProfileTableViewCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            propertyLabel.text = viewModel.propertyName
            propertyValueLabel.text = viewModel.propertyValue
        }
    }

}
