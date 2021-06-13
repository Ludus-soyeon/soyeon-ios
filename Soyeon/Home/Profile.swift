//
//  ProfileViewModel.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/06/13.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

struct ProfileViewModel: Hashable {
    enum Heart: Int {
        case opponent
        case opponentDouble
        case my
        case myDouble
    }
    
    let id: String = UUID().uuidString
    let nickName: String
    let age: Int
    let height: Int
    let occupation: String
    let bio: String
    let heart: Heart
    let image: UIImage?
}

extension ProfileViewModel {
    static func createDummy() -> ProfileViewModel {
        ProfileViewModel(
            nickName: .nickName,
            age: .age,
            height: .height,
            occupation: .occupation,
            bio: .bio,
            heart: .heart,
            image: nil
        )
    }
}

private extension Int {
    static var age: Int {
        Int.random(in: 20...40)
    }
    
    static var height: Int {
        Int.random(in: 140...190)
    }
}

private extension String {
    static var nickName: String {
        [
            "소연",
            "일리",
            "가입했어요"
        ].randomElement() ?? ""
    }
    
    static var occupation: String {
        [
            "마케팅",
            "공기업",
            "외국계기업"
        ].randomElement() ?? ""
    }
    
    static var bio: String {
        [
            "센스있는 해결사 고양이",
            "무리를 이끄는 우두머리 늑대"
        ].randomElement() ?? ""
    }
}

extension ProfileViewModel.Heart: CustomStringConvertible {
    var description: String {
        switch self {
        case .opponent:
            return "상대의 하트"
        case .opponentDouble:
            return "상대의 더블 하트"
        case .my:
            return "나의 하트"
        case .myDouble:
            return "나의 더블 하트"
        }
    }
    
    typealias Heart = ProfileViewModel.Heart
    
    static var heart: Heart {
        [
            Heart.opponent,
            Heart.opponentDouble,
            Heart.my,
            Heart.myDouble
        ].randomElement() ?? .opponent
    }
}
