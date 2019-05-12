//
//  StoreViewController + UITableViewDelegate + UITableViewDataSource.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 03/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

extension StoreViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "StoreCell", for: indexPath) as? StoreTableViewCell
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        tableViewCell.viewModel = cellViewModel        
        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.selectRow(atIndexPath: indexPath)
    }
}
