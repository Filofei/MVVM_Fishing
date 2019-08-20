//
//  ProfileViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond
import RealmSwift

class ProfileViewController: UIViewController  {

    private var token: NotificationToken?
    private let realm = try! Realm()
    var appearanceManager: AppearanceManager?
    var viewModel: ProfileViewModelType?
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var recordsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialize()
        self.setAppearance()
        self.bindUIElements()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setLayoutSensitiveAppearance()
    }
    
    private func initialize() {
        self.appearanceManager = AppearanceManager(in: self)
        viewModel = ProfileViewModel()
        tableView.delegate = self
        tableView.dataSource = self
        topView.parentViewController = self
        token = realm.observe { (notification, realm) in
            self.updateUI()
        }
    }

}
