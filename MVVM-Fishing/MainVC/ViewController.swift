//
//  ViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 22/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var toPondMenu: UIButton!
    var viewModel: MainViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
    }


}

