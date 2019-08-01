//
//  PondsViewModelType.swift

import Bond

protocol PondsViewModelType {
    var userMoney: Observable<String> { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PondsCollectionViewCellViewModelType?
    func numberOfRows() -> Int 
}
