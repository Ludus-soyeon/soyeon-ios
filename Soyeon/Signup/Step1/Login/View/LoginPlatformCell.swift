//
//  LoginPlatformCell.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/03.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class LoginPlatformCell: UITableViewCell {

    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var platformImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none

        shadowView.setShadowWithColor(color: .black,
                                      opacity: 0.12,
                                      offset: CGSize(width: -3, height: 1),
                                      radius: 33,
                                      viewCornerRadius: 33)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setProperties(_ platform: Login.Platform) {
        platformImageView.image = UIImage(named: platform.info.imageName)
        titleLabel.text = platform.info.title
    }

}
