//
//  SoyeonRatingView.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class SoyeonRatingView: UIView {
    typealias Level = (score: Float, title: String)
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func configure(with viewModel: SoyeonRatingViewModel) {
        stackView.removeAllArrangedSubviews()
        let sortedLevels = viewModel.levels.sorted { $0.score < $1.score }
        sortedLevels.forEach {
            let isLevelAchieved = $0.score <= viewModel.currentScore
            if !stackView.arrangedSubviews.isEmpty {
                stackView.addArrangedSubview(makeLine(isHightlight: isLevelAchieved))
            }
            stackView.addArrangedSubview(makeLevelView(level: $0, isLevelAchieved: isLevelAchieved))
        }
    }
    
    private func makeLine(isHightlight: Bool) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = isHightlight ? Colors.soyeonBlue.color()
            : UIColor(r: 242, g: 242, b: 242)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.widthAnchor.constraint(equalToConstant: 32).isActive = true
        return view
    }
    
    private func makeLevelView(level: Level, isLevelAchieved: Bool) -> UIView {
        let view: UIView
        if isLevelAchieved {
            view = UIImageView(image: UIImage(named: "icoCheckmark"))
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 20).isActive = true
            view.heightAnchor.constraint(equalToConstant: 20).isActive = true
        } else {
            view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.widthAnchor.constraint(equalToConstant: 16).isActive = true
            view.heightAnchor.constraint(equalToConstant: 16).isActive = true
            view.backgroundColor = UIColor(r: 239, g: 239, b: 239)
            view.layer.cornerRadius = 8
        }
        let label = UILabel()
        label.text = level.title
        label.font = Fonts.nanumSquareR.size(13)
        label.textColor = UIColor(r: 153, g: 153, b: 153)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 8).isActive =  true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }
}

struct SoyeonRatingViewModel {
    typealias Level = (score: Float, title: String)
    
    let currentScore: Float
    let levels: [Level]
}
