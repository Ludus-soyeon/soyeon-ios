//
//  IdealTypeInfoViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/03/13.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

struct IdealType: Codable {
    let startAge: Int
    let endAge: Int
    let startHeight: Int
    let endHeight: Int
    let form: String?
}

final class IdealTypeInfoViewController: SignupStepViewController<IdealType> {
    
    @IBOutlet private weak var ageDescriptionLabel: UILabel!
    @IBOutlet private weak var ageRangeSlider: RangeSlider!
    @IBOutlet private weak var heightDescriptionLabel: UILabel!
    @IBOutlet private weak var heightRangeSlider: RangeSlider!
    @IBOutlet private weak var formLabel: UILabel!
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
        formLabel.text = WriteProfileAlertViewModel.Form.slimHard.rawValue
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
    
    private func presentWriteProfile(_ writeProfile: WriteProfileAlertViewModel.WriteProfileItem,
                                     completion: @escaping (String?) -> Void) {
        writeProfile
            .alert(action: { (selection) in
                completion(selection)
            })
            .show(to: view)
    }
    
    @IBAction private func handleTap(_ sender: UITapGestureRecognizer) {
        let item = WriteProfileAlertViewModel.WriteProfileItem.form
        presentWriteProfile(item) { [weak self] selection in
            self?.formLabel.text = selection
        }
    }
    
    @IBAction private func ageSliderValueDidChange(_ sender: RangeSlider) {
        updateRangeLabel(ageDescriptionLabel, rangeSlider: sender, baseRange: ViewMetrics.ageRange)
    }
    
    @IBAction private func heightSliderValueDidChange(_ sender: RangeSlider) {
        updateRangeLabel(heightDescriptionLabel, rangeSlider: sender, baseRange: ViewMetrics.heightRange)
    }
    
    @IBAction private func didTapCompleteButton(_ sender: UIButton) {
        let phaseVC = PhaseViewController(phase: .second)
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(phaseVC,
                                                 animated: true)
    }
}

extension IdealTypeInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PersonalityType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalityInfoCell.reuseIdentifier,
                                                            for: indexPath) as? PersonalityInfoCell else {
            return UICollectionViewCell()
        }
        if let personalityType = PersonalityType(rawValue: indexPath.row) {
            let personalityInfo = String(describing: personalityType)
            cell.configure(personalityInfo)
        }
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
    
    func sizeForTag(at indexPath: IndexPath) -> CGSize {
        guard let personalityType = PersonalityType(rawValue: indexPath.row) else {
            return .zero
        }
        let personalityInfo = String(describing: personalityType)
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
