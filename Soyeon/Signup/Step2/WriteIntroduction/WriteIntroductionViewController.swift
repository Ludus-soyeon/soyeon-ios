//
//  WriteIntroductionViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/04/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

struct Introduction: Codable {
    var content: String?
}

final class WriteIntroductionViewController: SignupStepViewController<Introduction> {
    fileprivate var viewData: ViewDataType = .init() {
        willSet {
            setViewData(newValue)
        }
    }
    
    @IBOutlet private weak var textView: PlaceHolderTextView!
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let viewData = loadViewData() {
            self.viewData = viewData
            fillViewData(viewData)
            return
        }
        
    }
    
    private func fillViewData(_ data: ViewDataType) {
        textView.setOriginText(data.content,
                               color: Theme.disabledTitleTintColor)
        placeHolderTextViewDidChange(textView)
    }
    
    private func setupLayout() {
        setNavigationTitle("프로필 작성하기")
        textView.layer.borderColor = Theme.textViewBorderColor.cgColor
        
        textView.setPlaceHolderTextView(placeHolder: "10자 이상 입력해주세요",
                                        placeHoldColor: Theme.disabledTitleTintColor)
        textView.placeHolderDelegate = self
        
        bindButtonLayout()
    }
    
    private func bindButtonLayout() {
        buttonObserver = nextButton.observe(\.isEnabled, options: .new) { [weak nextButton] button, _ in
            if button.isEnabled {
                nextButton?.tintColor = Theme.enabledTitleTintColor
                nextButton?.backgroundColor = Theme.enabledBackgroundColor
            } else {
                nextButton?.tintColor = Theme.disabledTitleTintColor
                nextButton?.backgroundColor = Theme.disabledBackgroundColor
            }
        }
    }
    
    @IBAction private func didTapNextButton(_ sender: Any) {
        let vc = Step2.idealTyeInfo.loadedViewController
        
        self.navigationController?.pushViewController(vc,
                                animated: true)
    }
}

extension WriteIntroductionViewController: PlaceHolderTextViewDelegate {
    func placeHolderTextViewDidChange(_ textView: UITextView) {
        textViewDidChange(textView)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        nextButton.isEnabled = textView.text.count >= 10
        viewData = .init(content: textView.text)
    }
    
}
