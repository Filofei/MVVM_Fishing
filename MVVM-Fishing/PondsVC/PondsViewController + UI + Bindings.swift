//
//  PondsViewController + UI + Bindings.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 31.07.2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import Bond
import UIKit
import Lottie

extension PondsViewController {
    
    func updateUI() {
        self.userMoneyLabel.text = viewModel?.userMoney
        self.userLevelLabel.text = viewModel?.userLevel
    }
    
    func bindUI() {
                
        // FIXME: Fix default index
        
        headToBaseButton.reactive.controlEvents(.touchUpInside)
            .observeNext { _ in
                
                // Write new base value to Realm
                self.viewModel?.changeCurrentBase(toBase: self.centeredCollectionViewFlowLayout?.currentCenteredPage ?? 0) {
                    
                // Hide button and animate travel progress. Only in case of success.
                self.appearanceManager?.toggleViewAlpha(self.headToBaseButton,
                                                        false) { [unowned self] in
                        self.changeButtonState()
                        self.animateTravelProgress() { [unowned self] in
                            self.appearanceManager?.toggleViewAlpha(self.headToBaseButton,
                                                                    true,
                                                                    completion: nil)
                        }
                    }
                }
            }
            .dispose(in: bag)
    }
    
    func setAppearance() {
        self.appearanceManager?.setBackgroundColor()
        self.userMoneyLabel.textColor = Palette.darkGreen
        
        // FIXME: Move strings to "Strings"
        headToBaseButton.setTitleColor(.white, for: .normal)
        headToBaseButton.setTitle("Отправиться на базу", for: .normal)
        headToBaseButton.setTitleColor(Palette.darkGray, for: .disabled)
        headToBaseButton.setTitle("Текущая база", for: .disabled)
    }
    
    func focusCurrentBase() {
        self.centeredCollectionViewFlowLayout?.scrollToPage(index: self.viewModel?.currentBaseIndex ?? 0, animated: true)
    }
    
    func changeButtonState() {
        if viewModel?.currentBaseIndex == centeredCollectionViewFlowLayout?.currentCenteredPage {
            headToBaseButton.isEnabled = false
        } else {
            headToBaseButton.isEnabled = true
        }
        animateButtonStateChange(headToBaseButton.isEnabled)
    }
    
    func animateButtonStateChange(_ state: Bool) {
        switch state {
        case true:
            UIView.animate(withDuration: 0.25, animations: {
                self.headToBaseButton.backgroundColor = Palette.darkGreen
            })
        case false:
            UIView.animate(withDuration: 0.25, animations: {
                self.headToBaseButton.backgroundColor = .clear
            })
        }
    }
    
    func animateTravelProgress(_ completion: @escaping () -> Void) {
        travelAnimationView.animation = Animation.named("travel")
        travelAnimationView.contentMode = .scaleAspectFill
        travelAnimationView.play() { finished in
            completion()
        }
    }
}
