//
//  WriteProfileAlertViewModel.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
 
struct WriteProfileAlertViewModel {
    enum Title: String {
        case birthyear      = "출생년도를 선택해주세요"
        case education      = "학력을 선택해주세요"
        case job            = "직업/직장을 입력해주세요"
        case location1      = "선호지역1을 선택해주세요"
        case location2      = "선호지역2을 선택해주세요"
        case height         = "키를 선택해주세요"
        case form           = "체형을 선택해주세요"
        case religion       = "종교를 선택해주세요"
        case smoked         = "흡연정보를 선택해주세요"
        case drink          = "음주 정보를 선택해주세요"
    }
}

extension WriteProfileAlertViewModel.Title {
    func items() -> [String] {
        switch self {
        case .birthyear:
            return []
        case .education:
            return WriteProfile1.Education.stringAllValues
        case .job:
            return []
        case .location1, .location2:
            return WriteProfile1.Location.stringAllValues
        case .height:
            return []
        case .form:
            return WriteProfile1.Form.stringAllValues
        case .religion:
            return WriteProfile1.Religion.stringAllValues
        case .smoked:
            return WriteProfile1.Smoking.stringAllValues
        case .drink:
            return WriteProfile1.Drink.stringAllValues
        }
    }
}
