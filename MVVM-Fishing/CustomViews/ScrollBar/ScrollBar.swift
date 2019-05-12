//
//  ScrollBar.swift
//  MVVM-Fishing
//
//  Created by Роман Орлов on 01/03/2019.
//  Copyright © 2019 Роман Орлов. All rights reserved.
//

import UIKit

@IBDesignable open class ScrollBar: UIScrollView, ScrollBarCellDelegate {
    
    // MARK: Delegate
    
    /// The delegate for the ScrollBar. The delegate has the name barDelegate to avoid conflict with the delegate property of UIScrollView.
    
    @objc open weak var barDelegate: ScrollBarDelegate? = nil
    
    // MARK: Properties
    
    /// The optional array containig all the cells of the ScrollBar. You can fill it through using function addCells(withImages: [UIImage], text: [String?]).
    
    internal var cells: [ScrollBarCell] = [] {
        didSet {
            self.numberOfCells = cells.count
        }
    }
    
    var numberOfCells: Int = 0
    
    open var height: CGFloat = 80 {
        didSet {
            self.frame.size.height = height
            reloadCellsLayout(cellsToReload: cells)
        }
    }
    
    /// This variable determines the distance between the edge of the first cell and the egde of the ScrollBar.
    
    open var margin: CGFloat = 20
    
    /// This variable determines the ratio of cell width and distance between cells. You usually don't need to change it, so I made it private.
    
    private var distanceRate: CGFloat = 1.3
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
    
    // MARK: Public methods
    
    /// The crucial function in the class interface. Use it to fill the ScrollBar with data. You normally pass the array of images and an array of optional strings and the ScrollBar creates cells using them.
    
    public func addCells(withImages images: [UIImage?], text: [String?]) {
        for (index, image) in images.enumerated() {
            let cell = ScrollBarCell(frame: CGRect(x: CGFloat((self.height * distanceRate) * CGFloat(index)) + self.margin, y: CGFloat(0), width: self.height, height: self.height))
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
            cell.label.text = text[index]
            cell.delegate = self
            cell.index = index
            cells.append(cell)
            self.addSubview(cell)
        }
        self.contentSize = CGSize(width: height * distanceRate * CGFloat(numberOfCells),
                                  height: height)
    }
    
    /// This method animates the selection and deselection of the cells and passes the index of the selected cell using the delegate method.
    
    public func didSelectCell(atIndex index: Int) {
        barDelegate?.didSelectCell(atIndex: index)
        for cell in cells {
            if cell.index == index {
                cell.animateSelection()
            } else {
                cell.animateDeselection()
            }
        }
    }
    
    /// This method lets you select the certain a cell programmatically, e.g. when you need to preselect it in viewDidLoad(). You should set it after calling method addCells(withImages:text:).
    
    public func selectCell(atIndex index: Int) {
        didSelectCell(atIndex: index)
    }
    
    // MARK: Internal methods
    
    /// This method is designed to be called when you change the height property of the ScrollBar, so it lays out the cells again. It already has the animation, so you only need to manage the height property.
    
    
    func reloadCellsLayout(cellsToReload: [ScrollBarCell]) {
        for (index, cell) in cellsToReload.enumerated() {
            self.contentSize = CGSize(width: self.height * distanceRate * CGFloat(numberOfCells), height: height)
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: [.allowAnimatedContent, .layoutSubviews, .curveEaseIn],
                           animations: {cell.frame = CGRect(x: CGFloat((self.height * self.distanceRate) * CGFloat(index)) + self.margin, y: CGFloat(0), width: self.height, height: self.height)
                               cell.layoutCellContent()},
                           completion: nil)}
    }
    // MARK: Private methods

    /* This method makes the initial setup of the ScrollBar */
    
    private func initialize() -> () {
        self.frame.size.height = height
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.autoresizingMask = .flexibleWidth
    }

}
