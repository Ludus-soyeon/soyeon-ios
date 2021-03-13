//
//  AdditionalTableViewCell.swift
//  Soyeon
//
//  Created by 이재은 on 2021/03/08.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class AdditionalCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setProperties(_ title: String) {
        titleLabel.text = title
    }
    
}
