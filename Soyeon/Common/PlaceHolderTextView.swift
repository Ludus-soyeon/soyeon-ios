//
//  PlaceHolderTextView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/27.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UITextView

protocol PlaceHolderTextViewDelegate: class {
    func placeHolderTextViewDidChange(_ textView: UITextView)
}

final class PlaceHolderTextView: UITextView {
    weak var placeHolderDelegate: PlaceHolderTextViewDelegate?
    
    private var placeHolder: String = ""
    private var placeHoldColor: UIColor?
    private var originTextColor: UIColor?
    
    func setPlaceHolderTextView(placeHolder: String = "",
                                placeHoldColor: UIColor? = nil) {
        self.delegate = self
        self.placeHolder = placeHolder
        self.placeHoldColor = placeHoldColor
        text = placeHolder
    }
    
    private func isShowPlaceHolder(_ isShow: Bool) {
        if isShow {
            originTextColor = textColor
            textColor = placeHoldColor
            text = placeHolder
            return
        }
         
        textColor = originTextColor
    }
}

extension PlaceHolderTextView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = nil
        isShowPlaceHolder(false)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        isShowPlaceHolder(textView.text.isEmpty)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeHolderDelegate?.placeHolderTextViewDidChange(textView)
    }
}
