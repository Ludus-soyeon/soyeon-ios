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
    
    var viewModel: CheckMyCharacterViewModel = CheckMyCharacterViewModel(mbti: nil) {
        willSet {  viewData = newValue }
    }
    
    private var questions: [MQuestion] = []
    
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
        
        loadQuesions()
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
        return questions.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView
                .dequeueReusableCell(withReuseIdentifier: CheckMyCharacterCollectionViewCell.reuseIdentifier,
                                     for: indexPath) as? CheckMyCharacterCollectionViewCell
        else {
            return UICollectionViewCell()
        }
         
        cell.numberLabel.text = "\(indexPath.item + 1)"
        
        cell.cellData = questions[indexPath.item]
        
        cell.selectedItemButton = { (item) in
            // TODO: viewData 적재 작업 시 진행.
            
           // reload 필요 없음.
            
            /* Put Data of output.viewModel
             "mbti_id": 1,
             "point": 4
             */
            
            // selectedItemButton 선택 여부는 mbti_id, point로 지정됨.
            
            
            print(item.rawValue)
        }

        return cell
    }
 
} 

// MARK: - CheckMyCharacterPresenterOutput

extension CheckMyCharacterViewController: CheckMyCharacterViewControllerInput {
    
    // MARK: - Display logic
    
    func displayQuestions(_ questions: [MQuestion]) {
        self.questions = questions
        collectionView.reloadData()
    }
}
