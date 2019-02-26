//
//  ProfileViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var viewModel: ProfileMenuViewModel?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProfileMenuViewModel()
        
    }

}
