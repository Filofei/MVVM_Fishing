//
//  PondsViewController.swift

import UIKit
import CenteredCollectionView

class PondsViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userMoneyLabel: UILabel!
    
    var viewModel: PondsViewModelType?
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout?
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        bindUI()
    }
    
    // MARK: Public methods
    
    // MARK: Internal methods
    
    // MARK: Private methods
    
    private func initialize() {
        viewModel = PondsViewModel()
        topView.parentViewController = self
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollectionViewFlowLayout(withCellRatio: 0.7)
    }
    
    private func setupCollectionViewFlowLayout(withCellRatio ratio: CGFloat) {
        
        // Get the reference to the `CenteredCollectionViewFlowLayout`
        centeredCollectionViewFlowLayout = collectionView.collectionViewLayout as? CenteredCollectionViewFlowLayout
        
        if !((0.0...1.0) ~= ratio) {
            fatalError(FatalErrorMessages.Ponds.flowLayoutError.rawValue)
        }
        
        centeredCollectionViewFlowLayout?.itemSize = CGSize(
            width: view.bounds.width * ratio,
            height: view.bounds.height * ratio * ratio
        )
        
        // Modify the collectionView's decelerationRate
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        centeredCollectionViewFlowLayout?.minimumLineSpacing = 35

    }

}
