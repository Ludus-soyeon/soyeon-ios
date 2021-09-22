//
//  WriteProfileAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class WriteProfileAlertView: UIView, AnimationAlertible, XibLoadable {
    
    typealias XibViewType = WriteProfileAlertView
     
    @IBOutlet private weak var itemStackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var closeButton: UIButton!
    
    // SoyeonAlertable
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    static func alert(title: String? = nil) -> XibViewType? {
        let view = WriteProfileAlertView(frame: .zero)
      
        guard let alert = view.load() else {
            return nil
        }
        
        alert.setLayout()
        
        alert.titleLabel.text = title
        
        return alert
    }
    
    private func setLayout() {
        contentView.setRadius(4)
    }
    
    @IBAction private func closeButtonDidTap(_ sender: Any) {
        dismiss()
    }
}

extension WriteProfileAlertView: AlertActionAddinible {
    
    typealias ButtonType = WriteMyProfileAlertView
    typealias Param = String?
    
    func action(style: WriteProfileAlertViewModel.WriteProfileItem,
                completion: ((String?) -> Void)? = nil) -> Self {
        
        guard style.isEditer, let view = style.view(action: { completion?($0) }) else {
            let buttons = style.items.map {
                WriteProfileDefualtButton($0) { result in
                    completion?(result)
                }
            }
            
            insert(buttons: buttons)
            return self
        }
         
        insert(button: view)
        return self
    }
  
    /// WriteProfileItem의 String Array로 selection이 구성된 경우.
    private func insert(buttons: [WriteProfileDefualtButton]) {
        buttons.forEach { itemStackView.addArrangedSubview($0) }
    }
    
    func insert(button: WriteMyProfileAlertView) {
        itemStackView.addArrangedSubview(button)
    }
     
}
