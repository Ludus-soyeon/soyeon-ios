//
//  IdealTypeInfoViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/03/13.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class IdealTypeInfoViewController: SignupStepViewController<IdealType> {
    private lazy var _viewData: IdealType = loadViewData() ?? .init() {
        willSet { setViewData(newValue) }
    }
    
    private var selectedPersonalities: [PersonalityType] = []
    
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
        static let cellTitlePadding: CGFloat = 8.0
    }
    
    private enum Theme {
        static let cellTitleFont = Fonts.nanumSquareR.size(13.0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionViewHeightConstraint.constant = collectionView.contentSize.height
        
        // frame 초기화
        ageRangeSlider.minimumValue = 0
        heightRangeSlider.minimumValue = 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
         
        setupLayout()
        initalSliderValue(ageRange: _viewData.ageRange,
                          heightRange: _viewData.heightRange)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        selectedPersonalities = _viewData.personality ?? []
        
        selectedPersonalities.forEach {
            let indexPath = IndexPath(row: $0.rawValue, section: 0)
            
            collectionView.selectItem(at: indexPath,
                                      animated: false,
                                      scrollPosition: .top)
        }
    }
    
    private func updateViewData(to viewData: IdealType) {
        
        var existingData = _viewData
        
        if let lowerAge = viewData.lowerAge {
            existingData.lowerAge = lowerAge
        }
        
        if let upperAge = viewData.upperAge {
            existingData.upperAge = upperAge
        }
        
        if let lowerHeight = viewData.lowerHeight {
            existingData.lowerHeight = lowerHeight
        }
        
        if let upperHeight = viewData.upperHeight {
            existingData.upperHeight = upperHeight
        }
        
        if let form = viewData.form {
            existingData.form = form
        }
        
        if let personality = viewData.personality {
            existingData.personality = personality
        }
        
        _viewData = existingData
    }
    
    private func configureCollectionView() {
        collectionView.allowsMultipleSelection = true
        if let layout = collectionView.collectionViewLayout as? TagListLayout {
            layout.delegate = self
        }
    }
    
    private func initalSliderValue(ageRange: ClosedRange<CGFloat>,
                                   heightRange: ClosedRange<CGFloat>) {
        changeRange(ageRangeSlider,
                    from: ViewMetrics.ageRange,
                    in: ageRange)
        
        changeRange(heightRangeSlider,
                    from: ViewMetrics.heightRange,
                    in: heightRange)
        
        let ageRange = rangeValue(in: ageRangeSlider, baseRange: ViewMetrics.ageRange)
        let heightRange = rangeValue(in: heightRangeSlider, baseRange: ViewMetrics.heightRange)
        
        updateRangeLabel(ageDescriptionLabel, to: ageRange)
        updateRangeLabel(heightDescriptionLabel, to: heightRange)
    }
    
    private func changeRange(_ slider: RangeSlider,
                             from base: ClosedRange<CGFloat>,
                             in target: ClosedRange<CGFloat>) {
        slider.lowerValue = base.convertPercent(to: target.lowerBound)
        slider.upperValue = base.convertPercent(to: target.upperBound)
    }
    
    private func setupLayout() {
        setNavigationTitle("이상형 정보 수정하기")
        formLabel.text = _viewData.formValue
        
        let ageRange = rangeValue(in: ageRangeSlider, baseRange: ViewMetrics.ageRange)
        let heightRange = rangeValue(in: heightRangeSlider, baseRange: ViewMetrics.heightRange)
        
        updateRangeLabel(ageDescriptionLabel, to: ageRange)
        updateRangeLabel(heightDescriptionLabel, to: heightRange)
    }
    
    private func rangeValue(in slider: RangeSlider,
                            baseRange: ClosedRange<CGFloat>) -> ClosedRange<Int> {
        let range = slider.minimumValue...slider.maximumValue
        
        let minValue = Int(slider.lowerValue.convert(from: range,
                                                     to: baseRange))
        let maxValue = Int(slider.upperValue.convert(from: range,
                                                     to: baseRange))
        return minValue...maxValue
    }
    
    private func updateRangeLabel(_ label: UILabel, to range: ClosedRange<Int> ) {
        label.text = "\(range.lowerBound)~\(range.upperBound)"
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
            self?.updateViewData(to: IdealType(form: selection))
            self?.formLabel.text = selection
        }
    }
    
    @IBAction private func ageSliderValueDidChange(_ sender: RangeSlider) {
        let ageRange = rangeValue(in: sender, baseRange: ViewMetrics.ageRange)
        
        updateViewData(to: IdealType(lowerAge: ageRange.lowerBound,
                                     upperAge: ageRange.upperBound))
        
        updateRangeLabel(ageDescriptionLabel, to: ageRange)
    }
    
    @IBAction private func heightSliderValueDidChange(_ sender: RangeSlider) {
        let heightRange = rangeValue(in: sender, baseRange: ViewMetrics.heightRange)
        
        updateViewData(to: IdealType(lowerHeight: heightRange.lowerBound,
                                     upperHeight: heightRange.upperBound))
        
        updateRangeLabel(heightDescriptionLabel, to: heightRange)
    }
    
    @IBAction private func didTapCompleteButton(_ sender: UIButton) {
        let phaseVC = PhaseViewController(phase: .second)
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(phaseVC,
                                                 animated: true)
    }
}

extension IdealTypeInfoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedPersonalities.append(PersonalityType.allCases[indexPath.row])
        updateViewData(to: IdealType(personality: selectedPersonalities))
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        selectedPersonalities.removeAll { $0 == PersonalityType.allCases[indexPath.row] }
        updateViewData(to: IdealType(personality: selectedPersonalities))

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
        let cellSize = CGSize(width: stringSize.width + (ViewMetrics.cellTitlePadding * 2) ,
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

private extension ClosedRange where Bound == CGFloat {
    func convertPercent(to value: CGFloat) -> CGFloat {
        return (CGFloat(value) - lowerBound) / (upperBound - lowerBound)
    }
}
