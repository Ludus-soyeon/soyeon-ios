//
//  AuthErrorHandler.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/07.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
  
enum AuthError: Error {
    case failLogin
    case notToken
    case thirdParty(Error?)
}
 
protocol AuthErrorHandler {
    func errorHandler(_ error: AuthError?)
}

extension AuthErrorHandler {
    func errorHandler(_ error: AuthError?) {
        print(.error, "loginFail")
    }
}
