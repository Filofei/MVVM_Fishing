//
//  ProfileViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 09.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

extension ProfileViewController {
    
    func updateUI() {
        self.tableView.reloadData()
    }
    
    func bindUIElements() {
        recordsButton.reactive.tap
            .observeNext {
                
            }
            .dispose(in: bag)
    }
    
    func setAppearance() {
        self.appearanceManager?.setBackgroundColor()
        self.tableView.tableFooterView = UIView()
        
        self.recordsButton.backgroundColor = Palette.backgroundGreen
    }
    
    func setLayoutSensitiveAppearance() {
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.height / 2
    }
}
