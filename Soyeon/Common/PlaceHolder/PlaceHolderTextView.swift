//
//  PlaceHolderTextView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/27.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UITextView
import UIKit.UILabel

protocol PlaceHolderTextViewDelegate: class {
    func placeHolderTextViewDidChange(_ textView: UITextView)
}

class PlaceHolderTextView: UITextView {
    weak var placeHolderDelegate: PlaceHolderTextViewDelegate?
    
    private var placeHolder: String = ""
    private var placeHoldColor: UIColor?
    internal var originTextColor: UIColor?
     
    func setPlaceHolderTextView(placeHolder: String = "",
                                placeHoldColor: UIColor? = nil) {
        self.delegate = self
        self.placeHolder = placeHolder
        self.placeHoldColor = placeHoldColor
        text = placeHolder
    }
    
    func setOriginText(_ text: String?,
                       color: UIColor?) {
        originTextColor = textColor
        self.text = text
        textColor = color
    }
    
    func setTextColorToOrigin() {
        textColor = originTextColor
    }
     
    private func showPlaceHolder(_ isShow: Bool) {
        if isShow {
            setOriginText(placeHolder,
                          color: placeHoldColor)
            return
        }
        
        setTextColorToOrigin()
    }
}

extension PlaceHolderTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        showPlaceHolder(false)
    }
     
    func textViewDidChange(_ textView: UITextView) {
        setTextColorToOrigin()
        placeHolderDelegate?.placeHolderTextViewDidChange(textView)
    }
}
