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
    
    private var formatter = defaultFormatter
    
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
            UIColor(red: 111/255, green: 121/255, blue: 231/255, alpha: 1.0).cgColor,
            UIColor(red: 136/255, green: 111/255, blue: 212/255, alpha: 1.0).cgColor
        ]
    }
    
    func configure(with viewModel: AccountStatusViewModel) {
        titleLabel.text = viewModel.status.description
        dateLabel.text = "\(formatter.string(from: viewModel.date)) 기준"
        if case let .dating(_, startDate) = viewModel.status {
            coupleDateLabel.text = " /커플휴면 D+\(startDate.daysBetween(date: Date()))"
        }
    }
}

private extension AccountStatusView {
    static let defaultFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY.MM.dd"
        return formatter
    }()
}
