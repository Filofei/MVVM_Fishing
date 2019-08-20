//
//  PondMenuViewController.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift

class PondMenuViewController: UIViewController {

    var viewModel: PondMenuViewModelType?
    private let realm = try! Realm()
    var appearanceManager: AppearanceManager?
    
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var locationImageView: UIImageView! {
        willSet {
            newValue.layer.cornerRadius = newValue.frame.height / 12
        }
    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var goToLocationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        setAppearance()
    }
    
    func initialize() {
        self.appearanceManager = AppearanceManager(in: self)
        topView.parentViewController = self
        viewModel = PondMenuViewModel()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "" {
            if let destination = segue.destination as? LocationViewController {
                //destination.viewModel?.location = self.viewModel
            }
        }
    }
    
}
