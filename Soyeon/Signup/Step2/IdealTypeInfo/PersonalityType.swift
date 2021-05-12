//
//  PersonalityType.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/04/20.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

enum PersonalityType: Int, CaseIterable, CustomStringConvertible {
    case bright
    case tsundere
    case leadership
    case cutie
    case warm
    case peace
    case mood
    case consistent
    
    var description: String {
        switch self {
        case .bright:
            return "밝고 명량한 타입"
        case .tsundere:
            return "난스러운 츤데레 타입"
        case .leadership:
            return "리더십 있고 화통한 타입"
        case .cutie:
            return "시크한 귀염둥이"
        case .warm:
            return "내 사람에게만 따뜻"
        case .peace:
            return "둥글둥글 평화주의"
        case .mood:
            return "주변을 챙기는 분위기 메이커"
        case .consistent:
            return "한결같은 스타일"
        }
    }
}
