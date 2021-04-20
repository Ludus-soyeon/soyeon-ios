//
//  PersonalityInfoCell.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/04/16.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class PersonalityInfoCell: UICollectionViewCell {
    @IBOutlet private weak var titleLabel: UILabel!
    
    private enum ViewMetrics {
        static let cornerRadius: CGFloat = 14.0
        static let borderWidth: CGFloat = 1.0
    }
    
    private enum Theme {
        static let normalTintColor: UIColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        static let selectedTintColor: UIColor = Colors.soyeonBlue.color()
    }
    
    override var isSelected: Bool {
        didSet {
            titleLabel.textColor = isSelected ? Theme.selectedTintColor : Theme.normalTintColor
            self.layer.borderColor = isSelected ? Theme.selectedTintColor.cgColor : Theme.normalTintColor.cgColor
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    func setupLayout() {
        titleLabel.textColor = Theme.normalTintColor
        self.layer.borderColor = Theme.normalTintColor.cgColor
        self.layer.cornerRadius = ViewMetrics.cornerRadius
        self.layer.borderWidth = ViewMetrics.borderWidth
    }
    
    func configure(_ title: String) {
        self.titleLabel.text = title
    }
}
