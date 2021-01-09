//
//  GuidanceViewModel.swift
//  Soyeon
//
//  Created by 이재은 on 2020/12/25.
//  Copyright (c) 2020 ludus. All rights reserved.
//

import UIKit

enum Guidance {
    enum GuidanceType {
        case signupWating

        var title: String {
            switch self {
            case .signupWating: return "가입심사중"
            }
        }

        var content: String {
            switch self {
            case .signupWating: return "회원님의 가입심사를 진행하고 있습니다.\n조금만 기다려 주세요!"
            }
        }

        var imageName: String {
            switch self {
            case .signupWating: return "imgSubscriptionReview"
            }
        }

        var buttonText: String {
            switch self {
            case .signupWating: return "소연 이용 가이드"
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

