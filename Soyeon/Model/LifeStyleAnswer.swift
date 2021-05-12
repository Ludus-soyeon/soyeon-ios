//
//  LifeStyleAnswer.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

// MARK: - LifeStyleAnswer

struct LifeStyleAnswer: Codable {
    let answers: [Answer]
}

// MARK: - Answer

struct Answer: Codable {
    let answer: Int
    let id: Int
}
