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
    @IBOutlet var buttons: [UIButton]! {
        willSet {
            newValue.forEach {$0.layer.cornerRadius = 10}
        }
    }
    var viewModel: MainViewModel?
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        DispatchQueue.main.async {
            self.viewModel?.showDisclamerAlert(in: self)
        }
    }


}

