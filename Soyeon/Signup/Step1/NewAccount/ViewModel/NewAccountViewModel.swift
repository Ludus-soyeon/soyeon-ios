//
//  NewAccountViewModel.swift
//  Soyeon
//
//  Created by junyng on 2021/01/17.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

enum NewAccount {
    enum GenderType: Int, CaseIterable, CustomStringConvertible {
        case male
        case female
        
        var description: String {
            switch self {
            case .male:
                return "남자"
            case .female:
                return "여자"
            }
        }
        
        var boolValue: Bool {
            switch self {
            case .male:
                return true
            case .female:
                return false
            }
        }
    }
    
    struct NewAccountViewModel {
        let genderType: NewAccount.GenderType
    }
    
}

// MARK: - UserDefault ViewData
extension NewAccount.GenderType: Codable { }

extension NewAccount {
    struct ViewData: SignupDataStorable {
        var name: String?
        var nickName: String?
        var gender: NewAccount.GenderType?
        var phoneNumber: String? 
    }
}
