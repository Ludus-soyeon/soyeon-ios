//
//  SignupDataModel.swift
//  Soyeon
//
//  Created by 박은비 on 2021/08/03.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

protocol SignupDataStorable: Codable {
    init()
}
 
/// 저장할 데이터가 정의 안된 경우.
struct EmptySignupData: SignupDataStorable { }
   
