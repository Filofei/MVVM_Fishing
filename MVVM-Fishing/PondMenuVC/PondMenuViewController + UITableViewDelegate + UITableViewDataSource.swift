//
//  PondMenuViewController + UITableViewDelegate + UITableViewDataSource.swift

import UIKit

extension PondMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Implement all TableViewDelegate and TableViewDataSource methods. The methods below are mandatory.
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "PondMenuCell", for: indexPath) as? PondMenuTableViewCell
        
        guard let tableViewCell = cell, let viewModel = viewModel else { return UITableViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        
        cellViewModel?.currentBase = self.viewModel?.currentBase

        tableViewCell.viewModel = cellViewModel
        
        return tableViewCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.viewModel?.selectRow(atIndexPath: indexPath)
        self.updateUI()
    }
    
}
