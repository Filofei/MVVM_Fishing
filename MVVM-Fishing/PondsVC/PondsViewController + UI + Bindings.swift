//
//  PondsViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 31.07.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import Bond

extension PondsViewController {
    
    func bindUI() {
        self.viewModel?.userMoney.bind(to: self.userMoneyLabel.reactive.text)
    }
}
