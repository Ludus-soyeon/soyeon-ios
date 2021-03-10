//
//  PlaceHolderTextView+WarningText.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/07.
//  Copyright © 2021 ludus. All rights reserved.
//
import UIKit.UITextView

final class PlaceHolderWarningTextView: PlaceHolderTextView {
    
    private var warningString: String = ""
    private var warningColor: UIColor?
    
    func setPlaceHolderTextView(placeHolder: String = "",
                                placeHoldColor: UIColor? = nil,
                                warningString: String = "",
                                warningColor: UIColor? = nil) {
        super.setPlaceHolderTextView(placeHolder: placeHolder,
                                     placeHoldColor: placeHoldColor)
        
        self.warningString = warningString
        self.warningColor = warningColor
    }
    
    private func showWarning(_ isShow: Bool) {
        if isShow {
            setOriginText(warningString,
                          color: warningColor)
            return
        }
        
        textColor = originTextColor
    }
    
    func endEditing(finalText: String) {
        showWarning(finalText.isEmpty)
        endEditing(true)
    }
}

extension PlaceHolderWarningTextView {
    override func textViewDidBeginEditing(_ textView: UITextView) {
        super.textViewDidBeginEditing(textView)
        showWarning(false)
    }
}
