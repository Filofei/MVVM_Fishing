//
//  MainViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 22/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond
import RealmSwift

class MainViewController: UIViewController {

    @IBOutlet weak var toPondMenu: UIButton!
    @IBOutlet var buttons: [UIButton]! {
        willSet {
            newValue.forEach {$0.layer.cornerRadius = $0.frame.height / 8}
        }
    }
    @IBOutlet weak var currentBaseLabel: UILabel!
    
    private var token: NotificationToken?
    private let realm = try! Realm()
    var viewModel: MainViewModel?
    var appearanceManager: AppearanceManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        updateUI()
        setAppearance()
        DispatchQueue.main.async {
            self.viewModel?.showDisclamerAlert(in: self)
        }
    }
    
    private func initialize() {
        self.appearanceManager = AppearanceManager(in: self)
        self.viewModel = MainViewModel()
        token = realm.observe { (notification, realm) in
            self.updateUI()
        }
    }
    
    deinit {
        token?.invalidate()
    }

}

