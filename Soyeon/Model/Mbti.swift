//
//  Mbti.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

// MARK: - Mbti

struct Mbti: Codable {
    let questions: [MQuestion]
}

// MARK: - Question

struct MQuestion: Codable {
    let id: Int
    let question, trait: String
}
