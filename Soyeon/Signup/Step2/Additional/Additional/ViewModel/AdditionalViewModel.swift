//
//  AdditionalViewModel.swift
//  Soyeon
//
//  Created by 이재은 on 2021/03/08.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

/// 추가 매칭하기
enum AdditionalMatch {
    enum AdditionalMatchingType: Int, CaseIterable {
        case top10
        case personality
        case physical
        case lately
        case neighborhood
        case job
        case recommend
        case religion
        case interest
        case random
        
        var title: String {
            switch self {
            case .top10 :
                return "상위 10% 이성"
            case .personality :
                return "내가 원하는 성격 유형 이성"
            case .physical :
                return "내가 원하는 키와 체형을 가진 이성"
            case .lately :
                return "최근에 가입한 이성"
            case .neighborhood :
                return "같은 동네 이성"
            case .job :
                return "직업을 인증한 이성"
            case .recommend :
                return "소연이 추천하는 이성"
            case .religion :
                return "나와 같은 종교를 가진 이성"
            case .interest :
                return "나와 성격, 관심사가 비슷한 이성"
            case .random :
                return "랜덤 매칭"
            }
        }
    }
    
    struct AdditionalViewModel {
        var list: [AdditionalMatch.AdditionalMatchingType]
    }
}
