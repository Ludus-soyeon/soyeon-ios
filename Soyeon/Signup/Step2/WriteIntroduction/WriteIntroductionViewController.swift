//
//  WriteIntroductionViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/04/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

struct Introduction: SignupDataStorable {
    var content: String?
}

final class WriteIntroductionViewController: SignupStepViewController<Introduction> {
    @IBOutlet private weak var textView: PlaceHolderTextView!
    @IBOutlet private weak var nextButton: UIButton!
    
    private(set) var buttonObserver: NSKeyValueObservation?
    
    private enum Theme {
        static let textViewBorderColor = UIColor(r: 236, g: 236, b: 236)
        static let enabledTitleTintColor = UIColor.white
        static let disabledTitleTintColor = UIColor(r: 153, g: 153, b: 153)
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
        fillViewData(viewData)
    }
    
    private func fillViewData(_ data: Introduction) {
        guard let content = data.content else { return }
        textView.setOriginText(content,
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
        let photoRegistrationViewController = Step2.photoRegistration.loadedViewController
        
        self.navigationController?.pushViewController(photoRegistrationViewController,
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
