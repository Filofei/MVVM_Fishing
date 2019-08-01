//
//  PondsViewController + UICollectionViewDelegate + UICollectionViewDataSource.swift

import UIKit

extension PondsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Implement all CollectionViewDelegate and CollectionViewDataSource methods. The methods below are mandatory.
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "PondsCell", for: indexPath) as? PondsCollectionViewCell
        
        guard let collectionViewCell = cell, let viewModel = viewModel else { return UICollectionViewCell() }
        let cellViewModel = viewModel.cellViewModel(forIndexPath: indexPath)
        collectionViewCell.viewModel = cellViewModel
        
        return collectionViewCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 1
    }
    
    // FIXME: Correct cell scaling method!
   /* func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let _ = self.centeredCollectionViewFlowLayout?.currentCenteredPage else {
            return
        }
        self.collectionView.visibleCells.enumerated().forEach { (index, value) in
            if value.frame.contains(self.view.center) {
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                    value.transform = .init(scaleX: 1.1, y: 1.1)
                }, completion: nil)
            } else if !value.frame.contains(self.view.center) {
                UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseInOut], animations: {
                    value.transform = .identity
                }, completion: nil)
            }
        }
    } */
}
