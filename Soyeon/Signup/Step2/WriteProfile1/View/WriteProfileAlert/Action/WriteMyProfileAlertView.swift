//
//  WriteMyProfileAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

protocol WriteProfileAlertViewMakable: AnyObject {
    func setDelegate()
    func setupLayout()
}

protocol WriteProfileAlertCompleteButtonDelegate: AnyObject {
    func didTapCompleteButton()
}

class WriteMyProfileAlertView: UIView, WriteProfileAlertViewMakable {
    
    internal var actionClosure: ((String?) -> Void)?
    internal var result: String = ""
    
    weak var customButtonDelegate: WriteProfileAlertCompleteButtonDelegate?
   
    @IBOutlet private weak var completionButton: UIButton!
     
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    required init(_ style: WriteProfileAlertViewModel.WriteProfileItem,
                  willCompletion closure: @escaping (String?) -> Void) {
        super.init(frame: .zero)
        actionClosure = closure
    }
    
    @available(iOS 14.0, *)
    required init(_ style: WriteProfileAlertViewModel.WriteProfileItem,
                  action: UIAction) {
        super.init(frame: .zero)
        completionButton.addAction(action, for: .touchUpInside)
        
    }
     
    @IBAction private func didTapCompleteButton(_ sender: Any) {
        customButtonDelegate?.didTapCompleteButton()
        
        if result.isEmpty { return }
        actionClosure?(result)
    }
    
    func setDelegate() {}
    func setupLayout() {}
}
 
