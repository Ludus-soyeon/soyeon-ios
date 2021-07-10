//
//  SoyeonUserDefaultKey.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/05.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
 
@propertyWrapper
struct UserDefaultWrapper<T> {
    let key: SoyeonUserDefaultKey
    let defaultValue: T
    
    var wrappedValue: T? {
        get {
            return UserDefaults.object(forKey: key) as? T
        }
        set {
            guard let newValue = newValue else {
                UserDefaults.remove(forKey: key)
                
                return
            }
            
            UserDefaults.setValue(newValue, forKey: key)
        }
        
    }
}

/// Soyeon 서비스에서 사용될 UserDefualt Key 모음.
enum SoyeonUserDefaultKey: String {
    // 최종적으로 가입될 User 정보
    case user
    
    // 회원가입
    case saveSignUpLocation
     
}
