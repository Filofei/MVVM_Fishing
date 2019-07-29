//
//  InventoryViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

class InventoryViewController: UIViewController {

    var viewModel: InventoryViewModelType?
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tackleConditionLabel: UILabel!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bindUI()
    }
    
    private func initialize() {
        viewModel = InventoryViewModel()
        topView.parentViewController = self
        tableView.delegate = self
        tableView.dataSource = self
    }

}
