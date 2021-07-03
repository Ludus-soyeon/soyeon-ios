//
//  AuthInfo.swift
//  Soyeon
//
//  Created by 박은비 on 2021/06/26.
//  Copyright © 2021 ludus. All rights reserved.
//
import Foundation
  
protocol AuthInfo: AuthErrorHandler {
    typealias Success = ((_ authToken: String) -> Void)
    typealias Fail = ((AuthError?) -> Void)
    
    typealias Completion = (success: Success, failer: Fail?)
    
    func request(success: @escaping Success, failer: Fail?)
    func authorization(success: @escaping Success)
}
  
extension AuthInfo {
    func authorization(success: @escaping Success) {
        request(success: success,
                failer: errorHandler)
        
    }
     
}
