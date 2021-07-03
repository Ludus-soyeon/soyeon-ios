//
//  GIDAuth.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/07.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit.UIViewController

struct GIDAuth: AppAuthorizable, AuthErrorHandler {
    var clientID = SoyeonPrivateInfo.googleClientKey
    
    var issuer = URL(string: "https://accounts.google.com")!
    var clientSecret = ""
    var redirectURI = URL(string: "com.ludus.soyeon:/oauth2Callback")!
    
    var presenter: UIViewController
     
    init(presenter: UIViewController) {
        self.presenter = presenter
    }
}
