//
//  ScrollBarCell.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 01/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

open class ScrollBarCell: UIView {
    
    // MARK: Properties
    
    /// The index of the ScrollBarCell.
    
    open var index: Int = 0
    open var imageView = UIImageView()
    open var label = UILabel()
    let gestureRecognizer = UITapGestureRecognizer()
    weak var delegate: ScrollBarCellDelegate?
    
    // MARK: Initializers
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    convenience init(image: UIImage, text: String?) {
        self.init()
        self.imageView.image = image
        self.label.text = text
    }
    
    // MARK: Delegate methods
    
    @objc func viewWasTapped(sender: UITapGestureRecognizer) {
        delegate?.didSelectCell(atIndex: index)
    }
    // MARK: Internal methods
    
    /// This method is used by ScrollBar to layout the cells inside self.
    
    func layoutCellContent() {
        let cellHeight = self.frame.height
        let imageSize = cellHeight * 0.6
        imageView.frame.size = CGSize(width: imageSize, height: imageSize)
        imageView.frame.origin = CGPoint(x: (cellHeight / 2) - (imageSize / 2), y: cellHeight / 7)
        imageView.layer.cornerRadius = imageSize / 2
        imageView.layer.borderWidth = imageSize / 15
        label.frame.size = CGSize(width: self.frame.width, height: cellHeight * 0.2)
        label.frame.origin = CGPoint(x: 0, y: cellHeight - label.frame.height - 1)
    }
    
    /// This method is used by the ScrollBar to animate the cell when it is being selected.
    
    func animateSelection() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseIn], animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
            self.label.alpha = 0
        }, completion: nil)
    }
    
    /// This method is used by the ScrollBar to animate the cell when it is being deselected.
    
    func animateDeselection() {
        UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseOut], animations: {
            self.imageView.transform = CGAffineTransform.identity
            self.label.alpha = 1
        }, completion: nil)
    }
    
    // MARK: Private methods
    
    /* This method makes the initial setup of the ScrollBarCell. */

    private func initialize() {
        self.isUserInteractionEnabled = true
        setLabelAppearance()
        setimageViewAppearance()
        self.addSubview(imageView)
        self.addSubview(label)
        setGestureRecognizer()
        self.translatesAutoresizingMaskIntoConstraints = false
        layoutCellContent()
    }
    
    /* This method sets up and adds recognizers to the ScrollBarCell. */
    
    private func setGestureRecognizer() {
        gestureRecognizer.addTarget(self, action: #selector(viewWasTapped(sender:)))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        self.addGestureRecognizer(gestureRecognizer)
    }
    
    /* This method sets up the appearance of the ScrollBarCell Label. */
    
    private func setLabelAppearance() {
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 14)
    }
    
    /* This method sets up the appearance of the ImageView. */
    
    private func setimageViewAppearance() {
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.clear.cgColor
        imageView.layer.masksToBounds = true
    }
}
