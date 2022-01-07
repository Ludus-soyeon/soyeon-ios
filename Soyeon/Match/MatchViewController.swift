//
//  MatchViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/10/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MatchViewController: UIViewController {
    typealias Profile = ProfileViewModel
    
    enum Section: Int, CaseIterable {
        case developFeelings
        case highScoring
        case matchingSuccess
        case overpast
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let sections: [Section: [Profile]] = [
        .developFeelings: [.createDummy()],
        .highScoring: [.createDummy()],
        .matchingSuccess: [.createDummy()],
        .overpast: [.createDummy()]
    ]
    
    private lazy var titleBarButtonItem: UIBarButtonItem = {
        let label = UILabel()
        label.text = "지난 카드"
        label.textColor = Colors.strongBlack.color()
        label.font = Theme.titleFont
        return UIBarButtonItem(customView: label)
    }()
    
    private lazy var pointBarButtonItem: UIBarButtonItem = {
        let button = UIButton()
        button.setTitleColor(Colors.strongBlack.color(), for: .normal)
        button.setImage(UIImage(named: "icoItemGnbNormal"), for: .normal)
        button.setTitle("300", for: .normal)
        button.imageEdgeInsets.left = -2.0
        button.titleLabel?.font = Theme.subTitleFont
        button.tintColor = UIColor.clear
        return UIBarButtonItem(customView: button)
    }()
    
    private lazy var alarmBarButtonItem = UIBarButtonItem(
        image: UIImage(named: "icoAlarmGnbNew")?.withRenderingMode(.alwaysOriginal),
        style: .plain,
        target: nil,
        action: nil
    )
    
    private lazy var dataSource = createDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
        configureCollectionView()
    }
    
    private func configureNavigationBar() {
        navigationItem.leftBarButtonItem = titleBarButtonItem
        navigationItem.rightBarButtonItems = [alarmBarButtonItem, pointBarButtonItem]
    }
    
    private func configureCollectionView() {
        collectionView.register(ProfileCardCell.self,
                                forCellWithReuseIdentifier: "cell")
        collectionView.collectionViewLayout = createLayout()
        applySnapshots()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let layoutSize = ViewMetrics.cellSize
        let item = NSCollectionLayoutItem(layoutSize: layoutSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: layoutSize,
                                                       subitem: item,
                                                       count: 1)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = ViewMetrics.sectionInset
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func createDataSource() -> UICollectionViewDiffableDataSource<Section, Profile> {
        let dataSource = UICollectionViewDiffableDataSource<Section, Profile>(
            collectionView: collectionView) { (collectionView, indexPath, profile) -> UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProfileCardCell
                return cell
        }
        return dataSource
    }
    
    private func applySnapshots(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Profile>()
        Section.allCases.forEach {
            guard let profiles = sections[$0], !profiles.isEmpty else {
                return }
            snapshot.appendSections([$0])
            snapshot.appendItems(profiles)
        }
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }

}

private extension MatchViewController.Section {
    var title: NSAttributedString {
        switch self {
        case .developFeelings:
            return .make(
                content: "당신에게\n관심있는 인연",
                bold: "관심있는 인연"
            )
        case .highScoring:
            return .make(
                content: "당신에게\n높은 점수를 준 인연",
                bold: "관심있는 인연"
            )
        case .matchingSuccess:
            return .make(
                content: "매칭 성공\n인연",
                bold: "관심있는 인연"
            )
        case .overpast:
            return .make(
                content: "지난 인연",
                bold: "인연"
            )
        }
    }
}

private extension MatchViewController {
    enum Theme {
        static let backgroundColor = UIColor(
            red: 252/255,
            green: 252/255,
            blue: 252/255,
            alpha: 1.0
        )
        static let separatorColor = Colors.buttonDisabled.color()
        static let titleFont = Fonts.nanumSquareR.size(20.0)
        static let subTitleFont = Fonts.nanumSquareR.size(18.0)
    }
    
    enum ViewMetrics {
        static let cellSize = NSCollectionLayoutSize(
            widthDimension: .absolute(100),
            heightDimension: .estimated(100)
        )
        static let sectionInset = NSDirectionalEdgeInsets(
            top: 0,
            leading: 18,
            bottom: 0,
            trailing: 19
        )
    }
}
