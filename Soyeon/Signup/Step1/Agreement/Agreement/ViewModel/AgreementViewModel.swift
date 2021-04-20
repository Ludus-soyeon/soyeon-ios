//
//  AgreementViewModel.swift
//  Soyeon
//
//  Created by 박은비 on 2020/12/23.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit
enum Agreement {
     
    enum AgreementButtonTag: Int {
        case all            = 100
        case privacy        = 101
        case service        = 102
        case marketing      = 103
    }
    
    struct Agreements {
        var privacy: Bool        = false
        var service: Bool        = false
        var marketing: Bool      = false
        
        var all: Bool {
            get {
                return privacy && service && marketing
            }
            
            set {
                privacy = newValue
                service = newValue
                marketing = newValue
            }
        }
        
        mutating func setButtonState(_ buttonType: AgreementButtonTag,
                                     state: Bool) {
            switch buttonType {
            case .all:
                all = state
            case .privacy:
                privacy = state
            case .service:
                service = state
            case .marketing:
                marketing = state
            }
        }
    }
    
    struct Request {
        var agreements: Agreements
        let buttonType: AgreementButtonTag
        var state: Bool
    }
    
    struct Response {
        let agreements: Agreements 
    }
    
    struct AgreementViewModel {
        
        var agreements: Agreements = .init()
        
        func getButtonState(_ buttonTag: AgreementButtonTag) -> Bool {
            switch buttonTag {
            case .all:
                return agreements.all
            case .privacy:
                return agreements.privacy
            case .service:
                return agreements.service
            case .marketing:
                return agreements.marketing
            }
        }
    }
    
}

// MARK: - UserDefault ViewData
extension Agreement.Agreements: Codable { }
 
