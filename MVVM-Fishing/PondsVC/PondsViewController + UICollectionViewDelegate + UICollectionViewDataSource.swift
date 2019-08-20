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
    
   func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.changeButtonState()
    }
}
