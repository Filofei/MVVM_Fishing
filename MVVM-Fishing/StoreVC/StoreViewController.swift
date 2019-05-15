//
//  StoreViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond
import RealmSwift

class StoreViewController: UIViewController,  ScrollBarDelegate {

    var viewModel: StoreViewControllerViewModelType?
    @IBOutlet weak var purchaseButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollBar: ScrollBar!
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var moneyLabel: UILabel!
    let realm = try! Realm()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = StoreViewModel()
        viewModel?.viewController = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        topView.parentViewController = self
        
        scrollBar.barDelegate = self
        scrollBar.selectCell(atIndex: 0)
        scrollBar.addCells(withImages: viewModel?.scrollBarImages ?? [], text: viewModel?.scrollBarText ?? [])
        
        moneyLabel.text = self.viewModel?.money
        
        setAppearance()
        bindUIElements()
        }
    }

extension StoreViewController {
    
    func didSelectCell(atIndex index: Int) {
        viewModel?.chosenCategory = index
        viewModel?.deselectRow()
        tableView.reloadData()
    }
    private func bindUIElements() {
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
    
    private func setAppearance() {
        
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
