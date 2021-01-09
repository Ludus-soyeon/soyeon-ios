//
//  AgreementDetailViewModel.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

enum AgreementDetail {
    enum AgreementDetailType: Int {
        case privacy        = 101
        case service        = 102
        case marketing      = 103
        
        func detailTypeTitle() -> String {
            switch self {
            case .privacy: return "개인정보 이용 약관"
            case .service: return "서비스 이용약관"
            case .marketing: return "개인정보 이용 약관"
            }
        }
    }
      
    struct Request {
        let detailType: AgreementDetailType
    }
    
    struct Response {
        let title: String
        let content: String
    }
    
    struct AgreementDetailViewModel {
        var title: String?
        var content: String
    }
}
