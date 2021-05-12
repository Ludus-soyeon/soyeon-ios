//
//  WriteProfile1Worker.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

class WriteProfile1Worker {

    // MARK: - Business Logic

    func calculateAge(birthYear: String) -> Int {
        if let year = Int(birthYear) {
            return Date().year - year
        }
        
        return 0
    }
     
}
