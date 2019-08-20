//
//  PondsViewController.swift

import UIKit
import Lottie
import RealmSwift
import CenteredCollectionView

class PondsViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userMoneyLabel: UILabel!
    @IBOutlet weak var userLevelLabel: UILabel!
    @IBOutlet weak var travelAnimationView: AnimationView!
    @IBOutlet weak var headToBaseButton: UIButton! {
        willSet {
            newValue.layer.cornerRadius = newValue.frame.height / 2
        }
    }
    
    var viewModel: PondsViewModelType?
    var appearanceManager: AppearanceManager?
    private var token: NotificationToken?
    private let realm = try! Realm()
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout?
    
    // MARK: Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        updateUI()
        bindUI()
        setAppearance()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        focusCurrentBase()
    }
    
    // MARK: Public methods
    
    // MARK: Internal methods
    
    // MARK: Private methods
    
    private func initialize() {
        self.appearanceManager = AppearanceManager(in: self)
        self.viewModel = PondsViewModel()
        self.viewModel?.viewController = self
        self.topView.parentViewController = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.setupCollectionViewFlowLayout(withCellRatio: 0.7)
        token = realm.observe { (notification, realm) in
            self.updateUI()
        }
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
