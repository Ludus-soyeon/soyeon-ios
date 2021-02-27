//
//  WriteProfile1AlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class WriteProfileAlertView: SoyeonAlert<WriteProfileAlertView>, SoyeonAlertActionable { 
    
    typealias ActionStyle = WritingAlertStyle.Action
     
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var itemStackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var closeButton: UIButton!
 
    static func alert(title: String) -> Custom? {
        guard let alert = super.alert() else {
            return nil
        }
        
        alert.setLayout()
        alert.titleLabel.text = title
        
        return alert
    }
    
    private func setLayout() {
        alertView.setRadius(4)
    }
    
    @discardableResult
    func action(style: ActionStyle,
                completion: @escaping ((String?) -> Void)) -> Self {
        let action = WriteProfileAlertAction()
        
        switch style {
        case .items(let values):
            setItems(action.makeItems(values, action: { (result) in
                completion(result)
                self.dismiss()
            }))
        case .custom(let style):
            setInputViews(action.makeCustomView(with: style, action: { (result) in
                completion(result)
                self.dismiss()
            }))
        }
          
        return self
    }
    
    private func setItems(_ items: [WriteProfileDefualtButton]) {
        items.forEach { (button) in
            itemStackView.addArrangedSubview(button)
        }
    }
    
    private func setInputViews(_ customView: WriteProfileAlertCustomButton) {
        itemStackView.addArrangedSubview(customView)
    }
     
    @IBAction private func closeButtonDidTap(_ sender: Any) {
        dismiss()
    }
    
}
 
