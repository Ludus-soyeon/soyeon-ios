//
//  MyAttractivenessScoreViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MyAttractivenessScoreViewController: UIViewController {
    
    @IBOutlet private weak var userStackView: UIStackView!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var soyeonRatingView: SoyeonRatingView!
    @IBOutlet private weak var rescoreButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        configureView()
    }
    
    private func setupLayout() {
        setNavigationTitle("나의 매력지수")
    }
    
    private func configureView() {
        let currentScore: Float = 4.5
        scoreLabel.text = "\(currentScore)점"
        soyeonRatingView.configure(
            with: SoyeonRatingViewModel(
                currentScore: currentScore,
                levels: [
                    SoyeonRatingViewModel.Level(score: 1.0, title: "브론즈"),
                    SoyeonRatingViewModel.Level(score: 2.0, title: "실버"),
                    SoyeonRatingViewModel.Level(score: 3.0, title: "골드"),
                    SoyeonRatingViewModel.Level(score: 4.0, title: "루비"),
                    SoyeonRatingViewModel.Level(score: 5.0, title: "다이아")
                ]
            ))
    }
    
    @IBAction private func rescoreButtonTapped(_ sender: UIButton) {
        SoyeonBasicAlertView
            .alert(message: "매력지수를 새로 측정하려면\n5HP가 소모됩니다.")?
            .action(style: .basic("아이템 충전하기"), completion: { [weak self] _ in
                self?.setupRescoreLayout()
            })
            .action(style: .cancel("취소"), completion: { _ in })
            .show(to: self.view!, completion: nil)
    }
    
    private func setupRescoreLayout() {
        resetRatingLayout()
        userStackView.arrangedSubviews.forEach { $0.isHidden = true }
        let progressLabel = UILabel()
        progressLabel.font = Fonts.nanumSquareB.size(16)
        progressLabel.textAlignment = .center
        progressLabel.numberOfLines = 0
        progressLabel.text = "지금 소연 회원들에게\n내 매력지수를 다시 수집 중입니다."
        progressLabel.textColor = Colors.strongBlack.color()
        userStackView.addArrangedSubview(progressLabel)
        rescoreButton.isHidden = true
        let guideLabel = UILabel()
        guideLabel.font = Fonts.nanumSquareR.size(12)
        guideLabel.textAlignment = .center
        guideLabel.text = "일정 시간이 소요되니 기다려주세요!"
        guideLabel.textColor = UIColor(r: 102, g: 102, b: 102)
        guideLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(guideLabel)
        guideLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        guideLabel.topAnchor.constraint(equalTo: soyeonRatingView.bottomAnchor,
                                        constant: 35).isActive = true
    }
    
    private func resetRatingLayout() {
        soyeonRatingView.configure(
            with: SoyeonRatingViewModel(
                currentScore: 0.0,
                levels: [
                    SoyeonRatingViewModel.Level(score: 1.0, title: "브론즈"),
                    SoyeonRatingViewModel.Level(score: 2.0, title: "실버"),
                    SoyeonRatingViewModel.Level(score: 3.0, title: "골드"),
                    SoyeonRatingViewModel.Level(score: 4.0, title: "루비"),
                    SoyeonRatingViewModel.Level(score: 5.0, title: "다이아")
                ]))
    }
    
}
