//
//  InventoryViewController + UITableViewDelegate + UITableViewDataSource.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 12/05/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

extension InventoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "InventoryCell", for: indexPath) as? InventoryTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.selectRow(atIndexPath: indexPath)
        self.viewModel?.showPickerView(in: self, for: InventoryTypes.types[indexPath.row] as! Object.Type)
    }
}
