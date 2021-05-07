//
//  UserDefaultClass.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/08.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

/// UserDefault에 저장할 커스텀 클래스  
class UserClass: NSObject, NSCoding {
    
    var name: String?
    var nickname: String?
    var sex: Bool?
    var phone: String?
    
    override init() {
        super.init()
    }
    
    init(name aName: String? = nil,
         nickname aNickname: String? = nil,
         sex aSex: Bool? = nil,
         phone aPhone: String? = nil) {
        self.name       = aName
        self.nickname   = aNickname
        self.sex        = aSex
        self.phone      = aPhone
    }
    
    required init?(coder: NSCoder) {
        self.name        = coder.decodeObject(forKey: "name") as? String
        self.nickname    = coder.decodeObject(forKey: "nickname") as? String
        self.sex         = coder.decodeObject(forKey: "sex") as? Bool
        self.phone       = coder.decodeObject(forKey: "phoneNumber") as? String
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.nickname, forKey: "nickname")
        coder.encode(self.sex, forKey: "sex")
        coder.encode(self.phone, forKey: "phone")
        
    }
    
}

// MARK: -
protocol CustomClassObjectHandleable {
    associatedtype TargetClass: NSObject, NSCoding
    func getUserDefaultData(defaultKey: SoyeonUserDefaultKey) -> TargetClass
    func saveUserDefaultData(_ object: TargetClass,
                             defaultKey: SoyeonUserDefaultKey)
}

extension CustomClassObjectHandleable {
    func getUserDefaultData(defaultKey: SoyeonUserDefaultKey) -> TargetClass {
         
        let achievedData = UserDefaults.object(forKey: defaultKey)
        
        do {
            if let data = achievedData as? Data,
               let defaultObject = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? TargetClass {
                return defaultObject
            }
        } catch {
            print(error)
        }
        return TargetClass.init()
        
    }
    
    func saveUserDefaultData(_ object: TargetClass,
                             defaultKey: SoyeonUserDefaultKey) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: object,
                                                        requiringSecureCoding: false)
            
            UserDefaults.setValue(data,
                                  forKey: defaultKey)
            
        } catch {
            print(error)
            
        }
    }
}
