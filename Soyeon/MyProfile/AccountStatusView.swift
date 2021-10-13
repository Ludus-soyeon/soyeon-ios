//
//  AccountStatusView.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class AccountStatusView: XibView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var coupleDateLabel: UILabel!
    
    override final class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
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
        (layer as? CAGradientLayer)?.colors = [
            UIColor(r: 111, g: 121, b: 231).cgColor,
            UIColor(r: 136, g: 111, b: 212).cgColor
        ]
    }
    
    func configure(with viewModel: AccountStatusViewModel) {
        titleLabel.text = viewModel.status.description
        dateLabel.text = "\(viewModel.date.string()) 기준"
        if case let .dating(_, startDate) = viewModel.status {
            coupleDateLabel.text = " / 커플휴면 D+\(startDate.daysBetween(date: Date()))"
        }
    }
}
