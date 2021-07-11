//
//  AuthInfo.swift
//  Soyeon
//
//  Created by 박은비 on 2021/06/26.
//  Copyright © 2021 ludus. All rights reserved.
//
import Foundation
  
protocol AuthInfo: AuthErrorHandler {
    typealias Completion = (Result<String?, AuthError>)->Void
    
    func request(_ completion: @escaping Completion)
    func authorization(success: @escaping (_ token: String?) -> Void)
}
  
extension AuthInfo {
    func authorization(success: @escaping (_ token: String?) -> Void) {
        request { (result) in
            switch result {
            case .success(let token):
                guard let token = token else {
                    errorHandler(.notToken)
                    return
                }
                
                success(token)
            case .failure(let error):
                errorHandler(error)
            }
        }
    }
}
 
