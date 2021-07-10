//
//  SoyeonDefinedDefault.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/11.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
 
enum SYDefault {
    @UserDefaultWrapper(key: .saveSignUpLocation, defaultValue: "") static var saveSignUpLocation
}

enum SYDefaultObject {
    @ObjectUserDefaultWrapper(key: .user, dataType: User.self) static var user
}
