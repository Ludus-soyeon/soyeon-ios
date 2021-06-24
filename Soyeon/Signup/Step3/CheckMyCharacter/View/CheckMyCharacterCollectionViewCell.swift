//
//  CheckMyCharacterCollectionViewCell.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/31.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class CheckMyCharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var cellData: MQuestion? {
        willSet {
            guard let question = newValue else { return }
            fillData(question)
        }
    }
    
    var selectedItemButton: ((CheckMyCharacterViewModel.MbtiItem) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cleanLayout()
    }
    
    private func setupLayout() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
    
    private func cleanLayout() {
        titleLabel.text = ""
        numberLabel.text = ""
    }
    
    private func fillData(_ question: MQuestion) {
        let title = question.question
        titleLabel.text = title
        
    }
    
    @IBAction private func didTapItemButton(_ sender: UIButton) {
        guard let item = CheckMyCharacterViewModel.MbtiItem(rawValue: sender.tag)
        else { return }

        //        buttonSelected 처리
        selectedItemButton?(item)
    }
    
}
