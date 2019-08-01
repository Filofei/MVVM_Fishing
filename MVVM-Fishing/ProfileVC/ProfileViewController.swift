//
//  ProfileViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond

class ProfileViewController: UIViewController  {

    var viewModel: ProfileViewModelType?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var recordsButton: UIButton!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProfileViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        topView.parentViewController = self
    }
    
    private func bindUIElements() {
        recordsButton.reactive.tap
            .observeNext {
                
            }
            .dispose(in: bag)
    }

}
