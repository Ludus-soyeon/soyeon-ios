//
//  NSObject+.swift
//  Soyeon
//
//  Created by 이재은 on 2021/07/25.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

extension NSObject {
    static var classname: String {
        return String(describing: self)
    }

    var classname: String {
        return type(of: self).classname
    }
}
