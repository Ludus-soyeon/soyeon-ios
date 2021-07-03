//
//  DebugHelper.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

enum PrintType: CustomStringConvertible {
    case error
    case success
     
    var description: String {
        switch self {
        case .error:
            return "❌"
        case .success:
            return "✅" 
        }
    }
}

func print(_ type: PrintType? = nil, _ items: Any...) {
    print(type?.description ?? "", items)
}
