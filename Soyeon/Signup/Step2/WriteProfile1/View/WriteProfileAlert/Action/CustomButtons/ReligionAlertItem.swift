//
//  ReligionAlertItem.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UITextView
 
final class ReligionAlertItem: WriteProfileAlertCustomButton {
    @IBOutlet private weak var inputTextView: PlaceHolderTextView!
    
    override func setDelegate() {
        inputTextView.placeHolderDelegate = self
    }
    
    override func setupLayout() {
        inputTextView.setPlaceHolderTextView(placeHolder: "예시)University of Soyeon California 대학원 석사졸",
                                             placeHoldColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        
        inputTextView.textColor = Colors.black.color()
        inputTextView.textContainerInset = .init(top: 8, left: 12.4,
                                                 bottom: 8, right: 12.4)
        inputTextView.font = Fonts.nanumSquareR.size(13)
        
        inputTextView?.layer.borderWidth = 0.5
        inputTextView?.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        inputTextView.backgroundColor = .white
    }
}

extension ReligionAlertItem: PlaceHolderTextViewDelegate {
    func placeHolderTextViewDidChange(_ textView: UITextView) {
        inputText = textView.text
    }
}
