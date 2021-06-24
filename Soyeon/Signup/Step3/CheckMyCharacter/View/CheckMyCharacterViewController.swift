//
//  CheckMyCharacterViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol CheckMyCharacterViewControllerInput: CheckMyCharacterPresenterOutput {

}

protocol CheckMyCharacterViewControllerOutput {
    
    func loadQuesions()
}

final class CheckMyCharacterViewController: SignupStepViewController<CheckMyCharacterViewModel> { 
    fileprivate var viewData: ViewDataType = .init() {
        willSet {
            setViewData(newValue)
        }
    }
    
    var output: CheckMyCharacterViewControllerOutput!
    var router: CheckMyCharacterRouterProtocol!
    
    var viewModel: CheckMyCharacterViewModel = CheckMyCharacterViewModel.init(mbti: nil) {
        willSet {  viewData = newValue }
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    private enum ViewMetrics {
        static let leftSpacing: CGFloat = 18
        static let rightSpacing: CGFloat = 18
        static let cellWidth: CGFloat = UIScreen.main.bounds.width
        static let cellHeight: CGFloat = 100
    }
     
    // MARK: - Initializers

    init(configurator: CheckMyCharacterConfigurator = CheckMyCharacterConfigurator.shared) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }
 
    // MARK: - Configurator

    private func configure(configurator: CheckMyCharacterConfigurator = CheckMyCharacterConfigurator.shared) {

        configurator.configure(viewController: self)
    }
 
    // MARK: - View lifecycle
    
    override func viewDidLoad() {

        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        loadQuesions()
    }
    
    // MARK: - Load data
    private func loadQuesions() {
        output.loadQuesions()
    }
    
    private func setupLayout() {
         
        collectionViewFlowLayout.estimatedItemSize = CGSize(width: ViewMetrics.cellWidth,
                                                            height: ViewMetrics.cellHeight)
        
        collectionView.reloadData()
    }
}
extension CheckMyCharacterViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerView = collectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: "CheckMyCharacterCollectionHeaderView",
                                                  for: indexPath)
            return headerView
             
        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView
                .dequeueReusableSupplementaryView(ofKind: kind,
                                                  withReuseIdentifier: "CheckMyCharacterCollectionBottomView",
                                                  for: indexPath)
            return footerView
        default:
            return .init()
        }
    }
}

extension CheckMyCharacterViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
//        return viewModel.mbti?.questions.count ?? 0
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: CheckMyCharacterCollectionViewCell.reuseIdentifier,
                                     for: indexPath) as? CheckMyCharacterCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        if indexPath.row == 3 {
            cell.titleLabel.text = "asdfasdfasdfasdfa"
        }

        return cell
    }
 
}

// MARK: - CheckMyCharacterPresenterOutput

extension CheckMyCharacterViewController: CheckMyCharacterViewControllerInput {
    
    // MARK: - Display logic
    
    func displaySomething(viewModel: CheckMyCharacterViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
}
