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
    
    func configure(title: String) {
        self.titleLabel.text = title
    }
}
