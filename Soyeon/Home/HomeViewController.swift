//
//  HomeViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/05/20.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    typealias Profile = ProfileViewModel
    
    enum Section: Int, CaseIterable {
        case suggestion
        case selection
        case chance
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var sections: [Section: [Profile]] = [
        .suggestion: [.createDummy(), .createDummy()],
        .selection: [.createDummy(), .createDummy()],
        .chance: [.createDummy(), .createDummy(), .createDummy(), .createDummy()]
    ]
    
    private lazy var titleBarButtonItem: UIBarButtonItem = {
        let label = UILabel()
        label.text = "오늘의 인연"
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
    
    private lazy var alarmBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(
            image: UIImage(named: "icoAlarmGnbNew")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(alarmButtonTapped)
        )
    }()
    
    private lazy var dataSource = createDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
    }
    
    private func setupLayout() {
        navigationItem.leftBarButtonItem = titleBarButtonItem
        navigationItem.rightBarButtonItems = [alarmBarButtonItem, pointBarButtonItem]
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = Theme.backgroundColor
        collectionView.register(
            MatchSectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header"
        )
        collectionView.register(
            MatchSectionFooterView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: "footer"
        )
        collectionView.register(
            ProfileCell.self,
            forCellWithReuseIdentifier: "cell"
        )
        collectionView.collectionViewLayout = createLayout()
        collectionView.contentInset.bottom = 30.0
        applySnapshots()
    }
    
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            switch sectionKind {
            case .suggestion, .selection:
                return self.createListLayout()
            case .chance:
                return self.createGridLayout()
            }
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    private func createListLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: ViewMetrics.listItemSize)
        let groupSize = ViewMetrics.listItemSize
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: item,
            count: 1
        )
        let headerSize = ViewMetrics.headerSize
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = ViewMetrics.listItemSpacing
        section.contentInsets = ViewMetrics.listSectionInset
        section.boundarySupplementaryItems = [headerItem]
        return section
    }
    
    private func createGridLayout() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: ViewMetrics.gridItemSize)
        let groupSize = ViewMetrics.gridItemSize
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        let headerSize = ViewMetrics.headerSize
        let headerItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        let footerSize = ViewMetrics.footerSize
        let footerItem = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerSize,
            elementKind: UICollectionView.elementKindSectionFooter,
            alignment: .bottom
        )
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = ViewMetrics.gridItemSpacing
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        section.contentInsets = ViewMetrics.gridSectionInset
        section.boundarySupplementaryItems = [headerItem, footerItem]
        return section
    }
    
    private func createDataSource() -> UICollectionViewDiffableDataSource<Section, Profile> {
        let dataSource = UICollectionViewDiffableDataSource<Section, Profile>(
            collectionView: collectionView) { (collectionView, indexPath, profile) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ProfileCell
            if let section = Section(rawValue: indexPath.section) {
                cell?.configure(
                    layoutDirection: section != .chance ? .horizontal : .vertical,
                    profileViewModel: profile
                )
            }
            return cell
        }
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, elementKind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let section = Section(rawValue: indexPath.section) else { return nil }
            
            if elementKind == UICollectionView.elementKindSectionHeader {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "header",
                    for: indexPath
                ) as? MatchSectionHeaderView else { return nil }
                headerView.configure(title: section.title,
                                     subTitle: section.subTitle)
                return headerView
            } else {
                guard let footerView = collectionView.dequeueReusableSupplementaryView(
                    ofKind: UICollectionView.elementKindSectionFooter,
                    withReuseIdentifier: "footer",
                    for: indexPath
                ) as? MatchSectionFooterView else { return nil }
                return footerView
            }
        }
        return dataSource
    }
    
    private func applySnapshots(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Profile>()
        Section.allCases.forEach {
            guard let profiles = sections[$0], !profiles.isEmpty else { return }
            snapshot.appendSections([$0])
            snapshot.appendItems(profiles)
        }
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    @objc private func alarmButtonTapped() {
        performSegue(withIdentifier: "AlarmsViewController", sender: nil)
    }
}

private extension HomeViewController.Section {
    var title: NSAttributedString {
        switch self {
        case .suggestion:
            return NSAttributedString.make(content: "소연이\n제안하는 인연", bold: "제안하는 인연")
        case .selection:
            return NSAttributedString.make(content: "당신이\n선택한 인연", bold: "선택한 인연")
        case .chance:
            return NSAttributedString.make(content: "우연히 만난\n인연", bold: "인연")
        }
    }
    
    var subTitle: String {
        switch self {
        case .suggestion:
            return "당신의 맞춤 인연을 찾아드려요"
        case .selection:
            return "이상형 정보를 토대로 추천해드려요"
        case .chance:
            return "어쩌면 당신의 인연이 이곳에!"
        }
    }
}

private extension HomeViewController {
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
        static let listItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(140.0)
        )
        static let listItemSpacing: CGFloat = 12.0
        static let listSectionInset = NSDirectionalEdgeInsets(
            top: 16.0,
            leading: 18.0,
            bottom: 12.0,
            trailing: 18.0
        )
        
        static let gridItemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(162.0),
            heightDimension: .absolute(291.0)
        )
        static let gridItemSpacing: CGFloat = 14.0
        static let gridSectionInset = NSDirectionalEdgeInsets(
            top: 28.0,
            leading: 18.0,
            bottom: 32.0,
            trailing: 18.0
        )
        
        static let headerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(112.0)
        )
        static let footerSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(48.0)
        )
    }
}
