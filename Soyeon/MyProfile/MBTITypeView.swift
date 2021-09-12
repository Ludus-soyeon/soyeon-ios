//
//  MBTITypeView.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class MBTITypeView: XibView {
    @IBOutlet private weak var showDetailButton: UIButton!
    
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
        showDetailButton.layer.borderColor = UIColor(
            red: 236/255,
            green: 236/255,
            blue: 236/255,
            alpha: 1.0
        ).cgColor
    }

}
