//
//  PondMenuViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 20.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond

extension PondMenuViewController {
    
    func bindUI() {
            goToLocationButton.reactive.controlEvents(.touchUpInside)
            .observeNext { _ in
                
            }
            .dispose(in: bag)
    }
    
    func setAppearance() {
        
        appearanceManager?.setBackgroundColor()
        appearanceManager?.applyColorToText([averageDepthLabel, goToLocationButton.titleLabel], Palette.darkGreen)
        
        // TableView appearance
        
        self.tableView.tableFooterView = UIView()
    }
    
    func updateUI() {
        self.locationImageView.image = self.viewModel?.selectedLocationImage
        self.averageDepthLabel.text = self.viewModel?.averageDepth
    }
    
    func selectDefaultRow() {
        let indexPath = IndexPath(row: 0, section: 0)
        self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        self.tableView(self.tableView, didSelectRowAt: indexPath)
    }
}
