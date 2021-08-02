//
//  IdealType.swift
//  Soyeon
//
//  Created by 박은비 on 2021/08/01.
//  Copyright © 2021 ludus. All rights reserved.
//

import CoreGraphics

extension PersonalityType: Codable { }

struct IdealType: Codable {
    var lowerAge: Int? = DefaultRange.lowerAge
    var upperAge: Int? = DefaultRange.upperAge
    var lowerHeight: Int? = DefaultRange.lowerHeight
    var upperHeight: Int? = DefaultRange.upperHeight
    var form: String? = WriteProfileAlertViewModel.Form.slimHard.rawValue
    var personality: [PersonalityType]?
    
    init(lowerAge: Int? = nil,
         upperAge: Int? = nil,
         lowerHeight: Int? = nil,
         upperHeight: Int? = nil,
         form: String? = nil,
         personality: [PersonalityType]? = nil) {
        
        self.lowerAge = lowerAge
        self.upperAge = upperAge
        self.lowerHeight = lowerHeight
        self.upperHeight = upperHeight
        self.form = form
        self.personality = personality
        
    }
    
    private enum DefaultRange {
        static let ageInitalRange: ClosedRange<CGFloat> = 20...30
        static let heightInitalRange: ClosedRange<CGFloat> = 170...200
        
        static var lowerAge: Int {
            Int(ageInitalRange.lowerBound)
        }
        static var upperAge: Int {
            Int(ageInitalRange.upperBound)
        }
        static var lowerHeight: Int {
            Int(heightInitalRange.lowerBound)
        }
        static var upperHeight: Int {
            Int(heightInitalRange.upperBound)
        }
    }
}

extension IdealType {
    var ageRange: ClosedRange<CGFloat> {
        var lower: CGFloat = DefaultRange.ageInitalRange.lowerBound
        var upper: CGFloat = DefaultRange.ageInitalRange.upperBound
        
        if let lowerAge = lowerAge {
            lower = CGFloat(lowerAge)
        }
        
        if let upperAge = upperAge {
            upper = CGFloat(upperAge)
        }
        
        return lower...upper
    }
    
    var heightRange: ClosedRange<CGFloat> {
        var lower: CGFloat = DefaultRange.heightInitalRange.lowerBound
        var upper: CGFloat = DefaultRange.heightInitalRange.upperBound
        
        if let lowerHeight = lowerHeight {
            lower = CGFloat(lowerHeight)
        }
        
        if let upperHeight = upperHeight {
            upper = CGFloat(upperHeight)
        }
        
        return lower...upper
    }
    
    var formValue: String {
        form ?? WriteProfileAlertViewModel.Form.slimHard.rawValue
    }
    
}
