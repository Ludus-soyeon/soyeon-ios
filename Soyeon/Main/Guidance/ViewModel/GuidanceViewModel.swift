//
//  GuidanceViewModel.swift
//  Soyeon
//
//  Created by 이재은 on 2020/12/25.
//  Copyright (c) 2020 ludus. All rights reserved.
//

enum Guidance {
    enum GuidanceType {
        case signupWating
        case dormantAccount
        case coupleAccount
        case suspendedAccount

        var title: String {
            switch self {
            case .signupWating: return "가입심사중"
            case .dormantAccount: return "휴면 회원"
            case .coupleAccount: return "커플 휴면 회원"
            case .suspendedAccount: return "징계 회원"
            }
        }

        var content: String {
            switch self {
            case .signupWating:
                return "회원님의 가입심사를 진행하고 있습니다.\n조금만 기다려 주세요!"
            case .dormantAccount:
                return "매력 넘치는 6명의 이성이\n회원님을 기다리고 있습니다."
            case .coupleAccount:
                return "연인과 함께 성격 테스트를 통해 서로에 대해\n알아보는 시간을 가져보는건 어떠세요?"
            case .suspendedAccount:
                return "소연은 건전한 소개팅 생태계를 위해\n비매너 회원들을 징계합니다.\n서로를 위해 조금만 더 배려해주세요."
            }
        }

        var imageName: String {
            switch self {
            case .signupWating: return "imgSubscriptionReview"
            case .dormantAccount: return "imgDormantAccount"
            case .coupleAccount: return "imgCoupleDormant"
            case .suspendedAccount: return "imgSuspendedAccount"
            }
        }

        var buttonText: String {
            switch self {
            case .signupWating: return "소연 이용 가이드"
            case .dormantAccount: return "휴면 해제하고 소개 받기"
            case .coupleAccount: return "테스트 시작하기"
            case .suspendedAccount: return "서비스 이용 불가"
            }
        }
    }

    struct GuidanceViewModel {
        var title: String
        var content: String
        var imageName: String
        var buttonText: String
    }
}
