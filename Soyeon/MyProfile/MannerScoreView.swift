//
//  MannerScoreView.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MannerScoreView: XibView {
    
    @IBOutlet private weak var badgeLabel: UILabel!
    
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
        badgeLabel.layer.borderColor = Colors.soyeonBlue.cgColor()
    }

}
