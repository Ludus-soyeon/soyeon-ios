//
//  MbtiQuestion.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

// MARK: - MbtiQuestion

struct MbtiQuestion: Codable {
    let questions: [Question]
}

// MARK: - Question

struct Question: Codable {
    let id: Int
    let question, trait: String
}
