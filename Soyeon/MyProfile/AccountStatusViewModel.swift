//
//  AccountStatusViewModel.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/09/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

enum AccountStatus {
    case approved
    case waitingApproval
    case dating(nickname: String, startDate: Date)
    case dormant
    case waitingCoupleDormant
    
    var description: String {
        switch self {
        case .approved:
            return "정상 승인 완료"
        case .waitingApproval:
            return "승인 대기중"
        case .dating(let nickname, _):
            return "\(nickname)님과 알콩달콩 연애중!"
        case .dormant:
            return "휴면"
        case .waitingCoupleDormant:
            return "커플 휴면 신청 진행중"
        }
    }
}

struct AccountStatusViewModel {
    let status: AccountStatus
    let date: Date
}
