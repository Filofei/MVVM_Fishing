//
//  AppearanceManager.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 06.08.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

class AppearanceManager: AppearanceProtocol {
    
    weak var controller: UIViewController?
    
    init(in controller: UIViewController) {
        self.controller = controller
    }
    
    /// Sets the fixed background color of the viewcontroller's main view.
    
    public func setBackgroundColor() {
        self.controller?.view.backgroundColor = Palette.backgroundGreen
    }
    
    /// Sets the background color to the array of views.
    
    public func applyColorToViews(_ views: [UIView], _ color: UIColor) {
        views.forEach {
            $0.backgroundColor = color
        }
    }
    
    /// Sets view's alpha to 0 or 1 depending on passed state value. Animated.
    
    public func toggleViewAlpha(_ view: UIView, _ state: Bool, completion: (() -> Void)?) {
        UIView.animate(withDuration: 0.2, delay: 0, options: [.curveEaseOut], animations: {
            switch state {
            case true:
                view.alpha = 1.0
            case false:
                view.alpha = 0
            }
        }, completion: { (true) in completion?() })
    }
    
}
