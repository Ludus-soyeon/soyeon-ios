//
//  IdealTypeInfoViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/03/13.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class IdealTypeInfoViewController: UIViewController {
    
    @IBOutlet private weak var ageDescriptionLabel: UILabel!
    @IBOutlet private weak var ageRangeSlider: RangeSlider!
    @IBOutlet private weak var heightDescriptionLabel: UILabel!
    @IBOutlet private weak var heightRangeSlider: RangeSlider!
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    private enum ViewMetrics {
        static let ageRange: ClosedRange<CGFloat> = 20...49
        static let heightRange: ClosedRange<CGFloat> = 140...200
        static let cellHeight: CGFloat = 28.0
        static let cellSpacingForLine: CGFloat = 8.0
        static let cellSpacingForItem: CGFloat = 4.0
        static let cellTitlePadding: CGFloat = 4.0
    }
    
    private enum Theme {
        static let cellTitleFont = Fonts.nanumSquareR.size(13.0)
    }
    
    private let personalityList = [
        "밝고 명량한 타입", "난스러운 츤데레 타입",
        "리더십 있고 화통한 타입", "시크한 귀염둥이",
        "내 사람에게만 따뜻", "둥글둥글 평화주의",
        "주변을 챙기는 분위기 메이커", "한결같은 스타일"
    ]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViewHeightConstraint.constant = collectionView.contentSize.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupLayout()
    }
     
    private func configureCollectionView() {
        collectionView.allowsMultipleSelection = true
        if let layout = collectionView.collectionViewLayout as? TagListLayout {
            layout.delegate = self
        }
    }
    
    private func setupLayout() {
        setNavigationTitle("이상형 정보 수정하기")
        updateRangeLabel(ageDescriptionLabel, rangeSlider: ageRangeSlider, baseRange: ViewMetrics.ageRange)
        updateRangeLabel(heightDescriptionLabel, rangeSlider: heightRangeSlider, baseRange: ViewMetrics.heightRange)
    }
    
    private func updateRangeLabel(_ label: UILabel, rangeSlider: RangeSlider, baseRange: ClosedRange<CGFloat>) {
        let sliderRange = rangeSlider.minimumValue...rangeSlider.maximumValue
        let minValue = Int(rangeSlider.lowerValue.convert(from: sliderRange,
                                                          to: baseRange))
        let maxValue = Int(rangeSlider.upperValue.convert(from: sliderRange,
                                                          to: baseRange))
        label.text = "\(minValue)~\(maxValue)"
    }
    
    @IBAction private func ageSliderValueDidChange(_ sender: RangeSlider) {
        updateRangeLabel(ageDescriptionLabel, rangeSlider: sender, baseRange: ViewMetrics.ageRange)
    }
    
    @IBAction private func heightSliderValueDidChange(_ sender: RangeSlider) {
        updateRangeLabel(heightDescriptionLabel, rangeSlider: sender, baseRange: ViewMetrics.heightRange)
    }
}

extension IdealTypeInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personalityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalityInfoCell.reuseIdentifier,
                                                            for: indexPath) as? PersonalityInfoCell else {
            return UICollectionViewCell()
        }
        let personality = personalityList[indexPath.row]
        cell.configure(title: personality)
        return cell
    }
}

extension IdealTypeInfoViewController: TagListLayoutDelegate {
    func spacingForLine() -> CGFloat {
        return ViewMetrics.cellSpacingForLine
    }
    
    func spacingForItem() -> CGFloat {
        return ViewMetrics.cellSpacingForItem
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        sizeForTagAtIndexPath indexPath: IndexPath) -> CGSize {
        let personalityInfo = personalityList[indexPath.row]
        let stringSize = (personalityInfo as NSString).size(withAttributes: [
            NSAttributedString.Key.font: Theme.cellTitleFont
        ])
        let cellSize = CGSize(width: stringSize.width + ViewMetrics.cellTitlePadding,
                              height: ViewMetrics.cellHeight)
        return cellSize
    }
}

private extension FloatingPoint {
    func convert(from input: ClosedRange<Self>, to output: ClosedRange<Self>) -> Self {
        let x = (output.upperBound - output.lowerBound) * (self - input.lowerBound)
        let y = (input.upperBound - input.lowerBound)
        return x / y + output.lowerBound
    }
}
