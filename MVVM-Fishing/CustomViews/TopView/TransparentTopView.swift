//
//  TransparentTopView.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 24.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

final class TransparentTopView: TopView {
    
    override public var textColor: UIColor {
        return .darkGray
    }
    
    override public var bgColor: UIColor {
        return .clear
    }
    
}
