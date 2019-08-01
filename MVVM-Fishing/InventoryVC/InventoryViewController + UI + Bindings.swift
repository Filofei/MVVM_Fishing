//
//  InventoryViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23.07.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond

extension InventoryViewController {
    
    func bindUI() {
    
    self.viewModel?.tackleStatus.bind(to: tackleConditionLabel.reactive.text)
    self.viewModel?.tackleStatus.observeNext { _ in
        self.tableView.reloadData()
        }
        .dispose(in: bag)
    
    
    segmentedControl.reactive.selectedSegmentIndex.observeNext { value in
        self.viewModel?.selectedSegment = value
        self.viewModel?.updateTackleStatus()
        }
        .dispose(in: bag)
    }
    
}


