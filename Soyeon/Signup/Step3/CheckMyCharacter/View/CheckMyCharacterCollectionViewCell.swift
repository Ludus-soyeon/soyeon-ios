//
//  CheckMyCharacterCollectionViewCell.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/31.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class CheckMyCharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
 
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
}
