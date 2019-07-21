//
//  StoreViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 16/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

extension StoreViewController {
        
    func bindUIElements() {
        purchaseButton.reactive.tap
            .observeNext {
                self.viewModel?.addToInventory(completion: {
                    self.moneyLabel.text = self.viewModel?.money
                    self.viewModel?.deselectRow()
                    self.tableView.reloadData()
                })
            }
            .dispose(in: bag)
    }
    
    func setAppearance() {
        
        // ScrollBar appearance
        
        scrollBar.height = 70
        scrollBar.cells.forEach {
            $0.label.textColor = Palette.darkGreen
        }
        
        // TopView appearance
        
        topView.timeLabel.textColor = Palette.darkGreen
        topView.buttons?.forEach {
            $0.tintColor = Palette.darkGreen
        }
        
        // Other appearance
        
        moneyLabel.textColor = Palette.darkGreen
    }
}
