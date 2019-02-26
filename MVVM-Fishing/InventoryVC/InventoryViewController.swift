//
//  InventoryViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController {

    var viewModel: InventoryViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = InventoryViewModel()
        
    }

}
