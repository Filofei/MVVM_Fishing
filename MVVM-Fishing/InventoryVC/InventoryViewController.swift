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
    var appearanceManager: AppearanceManager?
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tackleConditionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setAppearance()
        bindUI()
    }
    
    private func initialize() {
        self.appearanceManager = AppearanceManager(in: self)
        self.viewModel = InventoryViewModel()
        self.topView.parentViewController = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

}
