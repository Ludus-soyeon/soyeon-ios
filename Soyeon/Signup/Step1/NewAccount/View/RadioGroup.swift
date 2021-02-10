//
//  RadioGroup.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/01/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class RadioGroup: UIControl {
    private let radioButtons: [RadioButton]
    private(set) var selectedIndex = 0 {
        willSet {
            guard radioButtons.indices.contains(newValue) else {
                return
            }
        }
        didSet {
            radioButtons.forEach {
                $0.isSelected = ($0.tag == selectedIndex)
            }
            sendActions(for: .valueChanged)
        }
    }
    
    init(items: [String], selectedIndex: Int) {
        self.radioButtons = items.map { item in
            let radioButton = RadioButton()
            radioButton.setTitle(item, for: .normal)
            return radioButton
        }
        self.selectedIndex = selectedIndex
        super.init(frame: .zero)
        setupButtons()
        configureStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStackView() {
        let stackView = UIStackView(arrangedSubviews: radioButtons)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        self.addSubview(stackView)
        let constraints = [
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupButtons() {
        radioButtons.enumerated().forEach { index, button in
            button.tag = index
            button.addTarget(self, action: #selector(radioButtonTapped), for: .touchUpInside)
            button.isSelected = (index == selectedIndex)
        }
    }
    
    @objc
    private func radioButtonTapped(button: RadioButton) {
        selectedIndex = button.tag
    }
}
