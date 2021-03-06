//
//  TopView.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 26/02/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit
import TinyConstraints

@IBDesignable class TopView: UIView {
    
    //MARK: Properties
    
    private enum Insets: CGFloat {
        case verticalInset = 7
        case horizontalInset = 10
    }
    public var textColor: UIColor {
        return Palette.darkGreen
    }
    public var bgColor: UIColor {
        return Palette.backgroundGreen
    } 
    public var backButton = UIButton.init(type: .system)
    public var settingsButton = UIButton.init(type: .system)
    public var timeLabel = UILabel()
    var useDefaultSecondButtonController: Bool = true
    weak var parentViewController: UIViewController?
    var secondButtonViewController: UIViewController?
    var buttons: [UIButton]?

    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    convenience init(parentController: UIViewController, buttonController: UIViewController) {
        self.init()
        parentViewController = parentController
        initialize()
    }
    
    // MARK: Methods
    
    /// This method makes the initial setup of the TopView

    public func initialize() {
        buttons = [backButton, settingsButton]
        self.backgroundColor = bgColor
        createButtons(buttons!)
        createLabel(timeLabel)
    }
    
    /// This method creates and lays out the buttons
    
    private func createButtons(_ buttons: [UIButton]) {
        buttons.forEach {
            self.addSubview($0)
            $0.tintColor = textColor
            $0.aspectRatio(2.5)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            $0.centerYToSuperview()
        }
        
        // Set edges layout
        
        buttons[0].edges(to: self, excluding: .right, insets: .top(Insets.verticalInset.rawValue) + .bottom(Insets.verticalInset.rawValue) + .left(Insets.horizontalInset.rawValue), relation: .equal, priority: .required, isActive: true)
        buttons[1].edges(to: self, excluding: .left, insets: .top(Insets.verticalInset.rawValue) + .bottom(Insets.verticalInset.rawValue) + .right(Insets.horizontalInset.rawValue), relation: .equal, priority: .required, isActive: true)
        
        // Add actions
        
        buttons[0].addTarget(self, action: #selector(closeVC(_:)), for: .touchUpInside)
        buttons[1].addTarget(self, action: #selector(openSettings(_:)), for: .touchUpInside)
        
        // Set appearance
        
        buttons[0].setTitle("Назад", for: .normal)
        buttons[1].setTitle("Настройки", for: .normal)
    }
    
    /// This method creates and lays out the label

    private func createLabel(_ label: UILabel) {
        self.addSubview(label)
        label.centerInSuperview()
        label.edges(to: self, insets: .top(Insets.verticalInset.rawValue) + .bottom(Insets.verticalInset.rawValue), relation: .equal, priority: .defaultHigh, isActive: true)
        label.leftToRight(of: backButton)
        label.rightToLeft(of: settingsButton)
        label.textColor = textColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.text = "00:00"
    }
    
    /// This method dismisses the View Controller containing the Top View
    
    @objc func closeVC(_ sender: Any) {
        self.parentViewController?.dismiss(animated: true, completion: nil)
    }
    @objc func openSettings(_ sender: Any) {
        if let parent = parentViewController, let child = secondButtonViewController {
            parent.addChild(child)
        }
    }
    
}

extension TopView {
    func setSettingsViewController() throws {

            let storyboard = UIStoryboard(name: "SettingsVCStoryboard", bundle: .main)
            storyboard.instantiateViewController(withIdentifier: "<#T##String#>")

    }
}

