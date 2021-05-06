//
//  WriteIntroductionViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/04/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class WriteIntroductionViewController: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var nextButton: UIButton!
    
    private(set) var buttonObserver: NSKeyValueObservation?
    
    private enum Theme {
        static let textViewBorderColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0)
        static let enabledTitleTintColor = UIColor.white
        static let disabledTitleTintColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        static let enabledBackgroundColor = Colors.soyeonBlue.color()
        static let disabledBackgroundColor = Colors.buttonDisabled.color()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.endEditing(true)
    }
    
    deinit {
        buttonObserver = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    private func setupLayout() {
        setNavigationTitle("프로필 작성하기")
        textView.layer.borderColor = Theme.textViewBorderColor.cgColor
        bindButtonLayout()
    }
    
    private func bindButtonLayout() {
        buttonObserver = nextButton.observe(\.isEnabled, options: .new) { [weak nextButton] button, change in
            nextButton?.tintColor = button.isEnabled ? Theme.enabledTitleTintColor : Theme.disabledTitleTintColor
            nextButton?.backgroundColor = button.isEnabled ? Theme.enabledBackgroundColor : Theme.disabledBackgroundColor
        }
    }
    
}

extension WriteIntroductionViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        nextButton.isEnabled = textView.text.count >= 10
    }
}
