//
//  StoreViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 16/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond

extension StoreViewController {
        
    func bindUI() {
                
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
        
        self.appearanceManager?.setBackgroundColor()
        
        // TableView appearance
        
        self.tableView.tableFooterView = UIView()
        
        // ScrollBar appearance
        
        scrollBar.height = 70
        scrollBar.cells.forEach {
            $0.label.textColor = Palette.darkGreen
        }
        
        // Other appearance
        
        moneyLabel.textColor = Palette.darkGray
        moneyLabel.backgroundColor = Palette.backgroundGreen
        purchaseButton.backgroundColor = Palette.backgroundGreen
        purchaseButton.titleLabel?.textColor = Palette.darkGreen
    }
}
