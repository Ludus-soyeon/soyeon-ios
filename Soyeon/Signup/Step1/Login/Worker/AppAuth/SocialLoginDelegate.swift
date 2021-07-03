//
//  SocialLoginDelegate.swift
//  Soyeon
//
//  Created by 박은비 on 2021/06/25.
//  Copyright © 2021 ludus. All rights reserved.
//
import Foundation
 
protocol SocialLoginDelegate: AnyObject {
    var completion: (User)->Void { get set }
    
    func setup()
    func connection()
    func disconnection()
    
    func callCompletion(with userInfo: User)
}

extension SocialLoginDelegate {
    func callCompletion(with userInfo: User) {
        completion(userInfo)
    }
    
}

