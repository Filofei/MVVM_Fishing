//
//  MainViewModel.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 23/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class MainViewModel {
    
    // MARK: Properties
    
    private let defaultsManager = DefaultsManager()
    private var disclamerAlert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    
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
