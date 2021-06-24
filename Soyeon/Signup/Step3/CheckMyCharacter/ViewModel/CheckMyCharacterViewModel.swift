//
//  CheckMyCharacterViewModel.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

struct CheckMyCharacterViewModel: Codable {
    var mbti: Mbti?
    
    enum MbtiItem: Int {
        case veryAgree      = 4
        case agree          = 3
        case disagree       = 2
        case veryDisagree   = 1
    }

}
