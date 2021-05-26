//
//  Step3.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

enum Step3: SignupStepProtocol {
   typealias EnumType = Self
   case none
   case checkMyCharacter
   
   var viewControllerName: String {
       switch self {
       case .checkMyCharacter:
           return "CheckMyCharacterViewController"
       case .none:
           return ""
       }
   }
   
   var rawValue: String {
       return viewControllerName
   }
   
   static func initRawValue(_ value: String) -> Step3? {
       switch value {
       case Step3.checkMyCharacter.rawValue:
        return Step3.checkMyCharacter
       default:
           return nil
       }
   }
   
}

extension Step3: LoadSignupView {
    var storyboardName: String { return "Step3" }
}
 
