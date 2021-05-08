//
//  Step2.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/09.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

enum Step2: SignupStepProtocol {
   typealias EnumType = Self
   case none
   case writeProfile1
   case writeIntroduction
   case idealTyeInfo
   
   var viewControllerName: String {
       switch self {
       case .writeProfile1:
           return "WriteProfile1ViewController"
       case .writeIntroduction:
           return "WriteIntroductionViewController"
       case .idealTyeInfo:
           return "IdealTypeInfoViewController"
       case .none:
           return ""
       }
       
   }
   
   var rawValue: String {
       return viewControllerName
   }
   
   static func initRawValue(_ value: String) -> Step2? {
       switch value {
       case Step2.writeProfile1.rawValue:
           return Step2.writeProfile1
       case Step2.writeIntroduction.rawValue:
           return Step2.writeIntroduction
       case Step2.idealTyeInfo.rawValue:
           return Step2.idealTyeInfo
       default:
           return nil
       }
   }
   
}

extension Step2: LoadSignupView {
   var storyboardName: String { return "Step2" }
}
