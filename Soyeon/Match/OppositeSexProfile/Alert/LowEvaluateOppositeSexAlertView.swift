//
//  LowEvaluateOppositeSexAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/10/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

final class LowEvaluateOppositeSexAlertBodyButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        setBorderWithColor(UIColor(r: 230, g: 230, b: 230), width: 1)
        setRadius(5)
    }
}
 
final class LowEvaluateOppositeSexAlertBody: UIView, XibLoadable {
    
    typealias XibViewType = LowEvaluateOppositeSexAlertBody
    
    @IBOutlet weak var selection: UIStackView! // 클래스 분리 필요.
     
}

final class LowEvaluateOppositeSexAlertView: AssemblyAlertView {
 
    private let bodyView: LowEvaluateOppositeSexAlertBody! = {
        let view =  LowEvaluateOppositeSexAlertBody.load(xibName: "OppositeSexAlerts",
                                                         identifier: "LowEvaluateOppositeSexAlertBody")
        return view!
    }()
    
    private let bottomStackView: UIStackView! = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.heightAnchor.constraint(equalToConstant: 46).isActive = true
        return stackView
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init() {
        super.init(body: bodyView, tail: bottomStackView,
                   size: .init(width: .init(310), height: .init(210)))
        configure()
        setupLayout()
    }
    
    private func configure() {
        insert(button: .init(.basic("제출하기"), willCompletion: didTapSubmitButton(_:)))
        insert(button: .init(.cancel("나중에 하기"), willCompletion: didTapPostponeButton(_:)))
    }
    
    private func setupLayout() {
        contentView.setRadius(4)
    }
    
    private func didTapSubmitButton(_ title: String?) {
//        print("제출")
        dismiss()
    }
    
    private func didTapPostponeButton(_ title: String?) {
//        print("나중에")
        dismiss()
    }
}

extension LowEvaluateOppositeSexAlertView: AlertActionAddinible {
    
    typealias ButtonType = SoyeonBasicAlertButton
    typealias ActionStyle = BasicAlertAction
    
    typealias Param = Void
    
    func insert(button: SoyeonBasicAlertButton) {
        bottomStackView.addArrangedSubview(button)
    }
    
}
