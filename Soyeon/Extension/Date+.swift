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
    
    func daysBetween(date: Date) -> Int {
        return Date.daysBetween(start: self, end: date)
    }
    
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        
        let start = calendar.startOfDay(for: start)
        let end = calendar.startOfDay(for: end)
        
        let dateComponents = calendar.dateComponents([.day], from: start, to: end)
        return dateComponents.value(for: .day)!
    }
}
