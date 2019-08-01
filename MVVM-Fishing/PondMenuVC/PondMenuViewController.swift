//
//  PondMenuViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class PondMenuViewController: UIViewController {

    var viewModel: PondMenuViewModelType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = PondMenuViewModel()
        
    }

}
