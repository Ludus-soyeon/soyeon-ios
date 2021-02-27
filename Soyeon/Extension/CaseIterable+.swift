//
//  CaseIterable.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

extension CaseIterable where Self: RawRepresentable {
    static var stringAllValues: [RawValue] {
        return allCases.map { $0.rawValue }
    }
}
