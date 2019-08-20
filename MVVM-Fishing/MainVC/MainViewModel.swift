//
//  MainViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import RealmSwift
import Bond

class MainViewModel {
    
    // MARK: Properties
    
    private let realm = try! Realm()
        
    private let defaultsManager = DefaultsManager()
    
    private var disclamerAlert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
    /// The base on which user is currently on
    
    var currentBase: String {
        var output: String = ""
        if let user = realm.object(ofType: User.self, forPrimaryKey: "user") {
            output += user.currentBase
        }
        return output
    }
    
    // MARK: Private methods
    
    private func configureAlert(alert: UIAlertController) {
        alert.title = "Внимание!"
        alert.message = StaticStrings.ServiceMessages.introMessage
        alert.addAction(UIAlertAction(title: "Понятно", style: .cancel, handler: nil))
    }
    
    // MARK: Public methods
    
    public func showDisclamerAlert(in controller: UIViewController) {
        if let unknownValue = defaultsManager.retrieveValue(DefaultsKeys.numberOfLaunches.rawValue) {
            if unknownValue is Int {
                let numberOfLaunches = unknownValue as! Int
                if numberOfLaunches <= 20 {
                    configureAlert(alert: self.disclamerAlert)
                    controller.present(self.disclamerAlert, animated: true, completion: nil)
                }
            }
        }
    }
}
