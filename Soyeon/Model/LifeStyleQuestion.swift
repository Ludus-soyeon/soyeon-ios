//
//  LifeStyleQuestion.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

// MARK: - LifeStyleQuestion

struct LifeStyleQuestion: Codable {
    let questions: [LQuestion]
}

// MARK: - Question

struct LQuestion: Codable {
    let id: Int
    let options: [Option]?
    let shot: Int
    let title, type: String
    let placeholder: String?
}

// MARK: - Option

struct Option: Codable {
    let id: Int
    let title: String
}
