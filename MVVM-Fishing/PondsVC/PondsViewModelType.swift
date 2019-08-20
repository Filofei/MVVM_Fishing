//
//  PondsViewModelType.swift

import Bond

protocol PondsViewModelType {
    var viewController: UIViewController? { get set }
    var userMoney: String { get }
    var userLevel: String { get }
    var currentBaseIndex: Int { get }
    func cellViewModel(forIndexPath indexPath: IndexPath) -> PondsCollectionViewCellViewModelType?
    func numberOfRows() -> Int
    func changeCurrentBase(toBase index: Int, completion: () -> Void)
}
