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
        
        initialize()
        setAppearance()
        bindUIElements()
    }
    
    private func initialize() {
        viewModel = StoreViewModel()
        viewModel?.viewController = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        topView.parentViewController = self
        
        scrollBar.barDelegate = self
        scrollBar.selectCell(atIndex: 0)
        scrollBar.addCells(withImages: viewModel?.scrollBarImages ?? [], text: viewModel?.scrollBarText ?? [])
        
        moneyLabel.text = self.viewModel?.money
    }
    
    internal func didSelectCell(atIndex index: Int) {
        viewModel?.chosenCategory = index
        viewModel?.deselectRow()
        tableView.reloadData()
    }
}


