//
//  InventoryViewController + UITableViewDelegate + UITableViewDataSource.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 12/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "InventoryCell", for: indexPath) as? InventoryTableViewCell
        
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        cellViewModel?.currentItem = fetchItemData(forIndexPath: indexPath, of: viewModel.currentTackle)
        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.selectRow(atIndexPath: indexPath)
        self.viewModel?.showPickerView(in: self, for: InventoryTypes.types[indexPath.row])
    }
    
    func fetchItemData(forIndexPath indexPath: IndexPath, of tackle: Tackle) -> ItemType? {
        switch indexPath.row {
        case 0:
            return tackle.rod
        case 1:
            return tackle.reel
        case 2:
            return tackle.line
        case 3:
            return tackle.hook
        case 4:
            return tackle.bait
        default:
            fatalError()
        }
    }
}
