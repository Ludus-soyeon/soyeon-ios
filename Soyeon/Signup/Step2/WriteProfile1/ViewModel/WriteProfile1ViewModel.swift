//
//  WriteProfile1.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

enum WriteProfile1 { 
    enum Education: String, CaseIterable {
        case highSchool     = "고졸"
        case college        = "전문대졸"
        case university     = "4년제졸"
        case graduate       = "석사"
    }
    
    enum Location: String, CaseIterable {
        case seoul          = "서울"
        case gyeonggi       = "경기도"
        case chungcheong    = "충청도"
        case gangwon        = "강원도"
        case gyeongsang     = "경상도"
        case jeolla         = "전라도"
        case jeju           = "제주도"
    }
    
    enum Form: String, CaseIterable {
        case glamour        = "글래머러스"
        case slim           = "슬림"
        case usually        = "보통"
        case someChubbie    = "약간통통"
        case chubby         = "통통"
        case slimHard       = "슬림탄탄"
    }
    
    enum Religion: String, CaseIterable {
        case none           = "무교"
        case christian      = "기독교"
        case catholic       = "천주교"
        case buddhism       = "불교"
    }
    
    enum Drink: String, CaseIterable {
        case none           = "안마심"
        case onceMonth      = "한달에 한번"
        case twiceMonth     = "한달에 2일 이상"
        case onceWeek       = "일주일에 한번"
        case twiceWeek      = "일주일에 2일 이상"
        case moreThan       = "일주일에 5~7일"
    }
    
    enum Smoking: String, CaseIterable {
        case none           = "비흡연"
        case smaker          = "흡연"
    }
    
    enum WriteProfileItem: Int, CaseIterable {
        case birthyear = 0
        case education
        case job
        case location1
        case location2
        case height
        case form
        case religion
        case smoked
        case drink
    }
    
    struct WriteProfile1 {
        var birthyear: Int
        var education: Education
        var job: String
        var location1: Location
        var location2: Location
        var height: Int
        var form: Form
        var religion: Int
        var smoked: Smoking
        var drink: Drink
    }
    
    struct Request {
    }
    
    struct Response {
    }
    
    struct WriteProfile1ViewModel {
        var profile: WriteProfile1?
    }
}
