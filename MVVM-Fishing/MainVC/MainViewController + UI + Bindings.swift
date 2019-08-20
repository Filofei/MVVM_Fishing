//
//  MainViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 11.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

extension MainViewController {
    
    func setAppearance() {
        
        self.appearanceManager?.setBackgroundColor()
    
        buttons.forEach {
        switch $0.tag {
        case 0, 2, 4:
            $0.backgroundColor = Palette.mediumGreen
            $0.titleLabel?.textColor = Palette.darkGreen
        default:
            $0.backgroundColor = Palette.darkGreen
            $0.titleLabel?.textColor = .white
        }
    }
    
        currentBaseLabel.textColor = Palette.darkGreen
    }
    
    func updateUI() {
        self.currentBaseLabel.text = viewModel?.currentBase
    }

}
