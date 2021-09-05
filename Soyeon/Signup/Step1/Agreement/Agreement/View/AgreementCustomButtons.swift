//
//  AgreementCustomButtons.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/26.
//  Copyright © 2020 ludus. All rights reserved.
//

import Foundation
import UIKit 
 
protocol ButtonLayoutChangable: UIButton {
    func setLayout(backgroundColor: UIColor?,
                   textColor: UIColor?,
                   boarderColor: UIColor?)
}

extension ButtonLayoutChangable {
    func setLayout(backgroundColor: UIColor? = nil,
                   textColor: UIColor? = nil,
                   boarderColor: UIColor? = nil) {
        if let backgroundColor = backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let textColor = textColor {
            self.titleLabel?.textColor = textColor
        }
        
        if let boarderColor = boarderColor {
            self.layer.borderColor = boarderColor.cgColor
        }
        
        layoutIfNeeded()
    }
}
 
class ButtonByState: UIButton, ButtonLayoutChangable {
    override var isSelected: Bool {
        willSet {
            changedState(newValue ? .selected : .disabled)
        }
    }
     
    struct StateUI {
        var state: UIControl.State
        var attribate: LayoutAttribute
    }
    
    struct LayoutAttribute {
        var backgroundColor: UIColor?
        var boarderColor: UIColor?
        var textColor: UIColor?
    }
    
    var stateUI: [StateUI] = []
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func changedState(_ state: UIControl.State) {
        stateUI.forEach { (stateUI) in
            if stateUI.state == state {
                setLayout(backgroundColor: stateUI.attribate.backgroundColor,
                          textColor: stateUI.attribate.textColor,
                          boarderColor: stateUI.attribate.boarderColor)
                return
            }
        }
    }
}
   
class AllAgreeButton: ButtonByState {
    override init() {
        super.init()
        set()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        set()
    }
     
    func set() {
        self.stateUI = [ButtonByState.StateUI(state: .disabled,
                                              attribate: .init(boarderColor: #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1),
                                                               textColor: #colorLiteral(red: 0.4, green: 0.4, blue: 0.4, alpha: 1))),
                        ButtonByState.StateUI(state: .selected,
                                              attribate: .init(boarderColor: Colors.soyeonBlue.color(),
                                                               textColor: Colors.soyeonBlue.color())) ]
        
        layer.cornerRadius = self.frame.height / 2
        layer.borderWidth = 1.0
         
        changedState(.disabled)
    }
}

class JoinButton: ButtonByState {
    
    override init() {
        super.init()
        set()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        set()
    }
     
    func set() {
        self.stateUI = [ButtonByState.StateUI(state: .disabled,
                                              attribate: .init(backgroundColor: #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1),
                                                               textColor: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1))),
                        
                        ButtonByState.StateUI(state: .selected,
                                              attribate: .init(backgroundColor: Colors.soyeonBlue.color(),
                                                               textColor: UIColor.white))]
        
        layer.cornerRadius = self.frame.height / 2
         
        changedState(.disabled)
    }
    
}
