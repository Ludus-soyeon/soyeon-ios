//
//  HeightAlertItem.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/28.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIPickerView

final class HeightAlertItem: WriteProfileAlertCustomButton {
    @IBOutlet private weak var inputPickerView: UIPickerView!
    private var heights = Array(100...220)
    private var standardHeight: Int {
        return heights[Int(heights.count / 2)]
    }
    
    override func setDelegate() {
        inputPickerView.delegate = self
        inputPickerView.dataSource = self
    }
    
    override func setupLayout() {
        inputPickerView.selectRow(standardHeightRow(),
                                  inComponent: 0,
                                  animated: false)
        
        inputText = String(standardHeight)
    }
    
    private func standardHeightRow() -> Int {
        return heights.firstIndex { standardHeight == $0 } ?? heights.count - 1
    }
     
}

extension HeightAlertItem: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
     
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        inputText = String(heights[row])
    }
}

extension HeightAlertItem: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heights.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(heights[row])"
    }
    
}
