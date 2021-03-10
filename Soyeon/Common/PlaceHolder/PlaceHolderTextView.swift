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
    var limitedTextCount: Int { get }
    func placeHolderTextViewDidChange(_ textView: UITextView)
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
}

extension PlaceHolderTextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard 0 < text.count else { return true }
        
        if let text = textView.text,
           limitedTextCount <= text.count {
            let endIndex = text.index(text.startIndex,
                                      offsetBy: (limitedTextCount - 1))
            textView.text = String(textView.text[..<endIndex])
        }

        return true
    }
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
        placeHolderDelegate?.placeHolderTextViewDidChange(textView)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return placeHolderDelegate?.textView(textView,
                                             shouldChangeTextIn: range,
                                             replacementText: text) ?? true
    }
    
}
