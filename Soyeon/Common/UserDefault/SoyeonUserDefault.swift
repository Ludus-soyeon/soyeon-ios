//
//  SoyeonUserDefault.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/05.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

protocol SoyeonUserDefault {
    static func remove(forKey: SoyeonUserDefaultKey) 
    static func setValue(_ value: Any?, forKey: SoyeonUserDefaultKey)
    static func object(forKey: SoyeonUserDefaultKey) -> Any?
}

extension SoyeonUserDefault {
    static func remove(forKey: SoyeonUserDefaultKey) {
        UserDefaults.standard.removeObject(forKey: forKey.rawValue)
    }
    
    static func setValue(_ value: Any?, forKey: SoyeonUserDefaultKey) {
        UserDefaults.standard.setValue(value, forKey: forKey.rawValue)
    }
     
    static func object(forKey: SoyeonUserDefaultKey) -> Any? {
        return UserDefaults.standard.object(forKey: forKey.rawValue)
    }
}

extension UserDefaults: SoyeonUserDefault {
}
