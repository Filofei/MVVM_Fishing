//
//  LocationViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

extension LocationViewController {
    
    func setAppearance() {
        
    }
    
    func updateUI() {
        self.locationImageView.image = self.viewModel?.locationImage
    }
}
