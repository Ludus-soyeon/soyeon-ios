//
//  CheckMyCharacterCollectionBottomView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright © 2021 ludus. All rights reserved.
//
 
import UIKit

class CheckMyCharacterCollectionBottomView: UICollectionReusableView {
    @IBOutlet private weak var completedButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        completedButton.setRadius(completedButton.frame.height / 2)
    }
    
}
