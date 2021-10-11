//
//  BirthYearAlertItem.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIPickerView

final class BirthYearAlertItem: WriteMyProfileAlertView {
    @IBOutlet private weak var inputPickerView: UIPickerView!
    private var thisYear = Date().year
    private lazy var years = Array(thisYear - 70...thisYear)
    private var standardYear: Int {
        return thisYear - 30
    }
    
    override func setDelegate() {
        inputPickerView.delegate = self
        inputPickerView.dataSource = self
    }
    
    override func setupLayout() {
        inputPickerView.selectRow(standardYearRow(),
                                  inComponent: 0,
                                  animated: false)
        
        result = String(standardYear)
    }
    
    private func standardYearRow() -> Int {
        return years.firstIndex { standardYear == $0 } ?? years.count - 1
    }
}

extension BirthYearAlertItem: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
     
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        result = String(years[row])
    }
}

extension BirthYearAlertItem: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(years[row])"
    }
    
}
