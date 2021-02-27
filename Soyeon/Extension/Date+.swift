//
//  Date+.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/27.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
 
extension Date {
    var year: Int {
        return Calendar.current.component(.year, from: self)
    }
}
