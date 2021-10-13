//
//  AlarmCell.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/10/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class AlarmCell: UICollectionViewCell {
    typealias AlarmCellViewModel = AlarmsViewController.AlarmCellViewModel
    
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var removeButtonTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    @IBAction private func removeButtonTapped(_ sender: UIButton) {
        removeButtonTapped?()
    }
    
    private func setupLayout() {
        setShadowWithColor(color: .black,
                           opacity: 0.04,
                           offset: CGSize(width: 3, height: 2),
                           radius: 0,
                           viewCornerRadius: 10)
    }
    
    func configure(with viewModel: AlarmCellViewModel) {
        if viewModel.isChecked {
            typeLabel.textColor = UIColor(r: 153, g: 153, b: 153)
            dateLabel.textColor = UIColor(r: 153, g: 153, b: 153)
            titleLabel.textColor = UIColor(r: 153, g: 153, b: 153)
        } else {
            typeLabel.textColor = (viewModel.type == .soyeonColumn)
                ? Colors.soyeonPurple.color() : Colors.soyeonBlue.color()
        }
        typeLabel.text = viewModel.type.description
        dateLabel.text = viewModel.date.string()
        titleLabel.text = viewModel.title
    }
    
}
