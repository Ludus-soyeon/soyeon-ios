//
//  CheckMyCharacterButton.swift
//  Soyeon
//
//  Created by 박은비 on 2021/06/08.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIButton

final class CheckMyCharacterButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadius(self.frame.height / 2)
    }
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setRadius(self.frame.height / 2)
    }
}
