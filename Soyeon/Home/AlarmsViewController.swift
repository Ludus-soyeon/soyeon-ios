//
//  AlarmsViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/10/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class AlarmsViewController: UIViewController {
    typealias Alarm = AlarmCellViewModel
    
    private enum Section {
        case main
    }
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private lazy var dataSource = createDataSource()
    private lazy var alarms: [Alarm] = {
        return alarmsInternal()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureCollectionView()
    }
    
    private func setupLayout() {
        navigationController?.navigationBar.topItem?.title = ""
        setNavigationTitle("알림")
    }
    
    private func configureCollectionView() {
        collectionView.register(UINib(nibName: "AlarmCell", bundle: .main),
                                forCellWithReuseIdentifier: AlarmCell.reuseIdentifier)
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
        section.contentInsets = ViewMetrics.sectionInset
        section.interGroupSpacing = ViewMetrics.lineSpacing
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func createDataSource() -> UICollectionViewDiffableDataSource<Section, Alarm> {
        return UICollectionViewDiffableDataSource<Section, Alarm>(collectionView: collectionView) {
            (collectionView, indexPath, alarm) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: AlarmCell.reuseIdentifier,
                for: indexPath) as? AlarmCell
            cell?.configure(with: alarm)
            cell?.removeButtonTapped = { [weak self] in
                self?.deleteAlarm(alarm)
            }
            return cell
        }
    }
    
    private func applySnapshots(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Alarm>()
        snapshot.appendSections([.main])
        snapshot.appendItems(alarms)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    private func deleteAlarm(_ alarm: Alarm) {
        guard let index: Int = self.alarms.firstIndex(where: { $0 == alarm }) else { return }
        alarms.remove(at: index)
        var snapshot = self.dataSource.snapshot()
        snapshot.deleteItems([alarm])
        dataSource.apply(snapshot)
    }
}

extension AlarmsViewController {
    enum AlarmType {
        case todayMatching
        case soyeonColumn
        case heartArrival
        
        var description: String {
            switch self {
            case .todayMatching:
                return "오늘의 매칭"
            case .soyeonColumn:
                return "소연 칼럼"
            case .heartArrival:
                return "하트 도착"
            }
        }
    }
    
    struct AlarmCellViewModel: Hashable {
        let title: String
        let date: Date
        let type: AlarmType
        let isChecked: Bool
        private let id = UUID()
    }
    
    private func alarmsInternal() -> [AlarmCellViewModel] {
        return [
            AlarmCellViewModel(
                title: "오늘의 인연이 소개되었습니다. 어떤 인연이 당신을 기다리고 있을까요?",
                date: Date(),
                type: .todayMatching,
                isChecked: false
            ),
            AlarmCellViewModel(
                title: "오늘의 인연이 소개되었습니다. 어떤 인연이 당신을 기다리고 있을까요?",
                date: Date(),
                type: .soyeonColumn,
                isChecked: false
            ),
            AlarmCellViewModel(
                title: "간장치킨님의 하트가 도착했습니다.",
                date: Date(),
                type: .heartArrival,
                isChecked: false
            ),
            AlarmCellViewModel(
                title: "간장치킨님의 하트가 도착했습니다.",
                date: Date(),
                type: .heartArrival,
                isChecked: true
            ),
            AlarmCellViewModel(
                title: "간장치킨님의 하트가 도착했습니다.",
                date: Date(),
                type: .heartArrival,
                isChecked: true
            )
        ]
    }
}

private extension AlarmsViewController {
    enum ViewMetrics {
        static let cellSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(100)
        )
        static let sectionInset = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 19
        )
        static let lineSpacing: CGFloat = 8
    }
}
