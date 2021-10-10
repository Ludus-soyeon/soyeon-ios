//
//  BasicProfileView.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class BasicProfileView: XibView {
    @IBOutlet private weak var editButton: UIButton!
    
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
        editButton.layer.borderColor = UIColor(
            red: 153/255,
            green: 153/255,
            blue: 153/255,
            alpha: 1.0
        ).cgColor
    }
}
