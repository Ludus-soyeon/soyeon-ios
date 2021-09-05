//
//  EducationAlertItem.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UITextView

final class EducationAlertItem: WriteProfileAlertCustomButton {
    @IBOutlet private weak var inputTextView: PlaceHolderWarningTextView!
    
    override func setDelegate() {
        inputTextView.placeHolderDelegate = self
        customButtonDelegate = self
    }
    
    override func setupLayout() { 
        inputTextView.setPlaceHolderTextView(placeHolder: "직접 입력해주세요",
                                             placeHoldColor: UIColor.black,
                                             warningString: "내용을 입력하세요!",
                                             warningColor: UIColor.red)
        
        inputTextView.textColor = Colors.black.color()
        inputTextView.textContainerInset = .init(top: 8, left: 12.4,
                                                 bottom: 8, right: 12.4)
        inputTextView.font = Fonts.nanumSquareR.size(13)
        
        inputTextView?.layer.borderWidth = 0.5
        inputTextView?.layer.borderColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        inputTextView.backgroundColor = .white
    }
}

extension EducationAlertItem: PlaceHolderTextViewDelegate {
    var limitedTextCount: Int {
        return 40
    }
    
    func placeHolderTextViewDidChange(_ textView: UITextView) {
        inputText = textView.text
    }
}

extension EducationAlertItem: WriteProfileAlertCompleteButtonDelegate {
    func didTapCompleteButton() {
        inputTextView.endEditing(finalText: inputText)
    }
}
