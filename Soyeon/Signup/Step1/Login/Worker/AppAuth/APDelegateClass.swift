//
//  APDelegateClass.swift
//  Soyeon
//
//  Created by 박은비 on 2021/06/25.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import AuthenticationServices
 
@available(iOS 13.0, *)
final class APDelegateClass: NSObject, SocialLoginDelegate, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    var completion: (User)->Void
    
    private var presentVC: UIViewController
    lazy var appleIDProvider = ASAuthorizationAppleIDProvider()
    lazy var request = appleIDProvider.createRequest()
    var controller: ASAuthorizationController?
      
    init(presentVC: UIViewController,
         completion: @escaping (User)->Void) {
        self.presentVC = presentVC
        self.completion = completion
        
        super.init()
        
        setup()
    }

    func setup() {
        request.requestedScopes = [.fullName, .email]
        controller = ASAuthorizationController(authorizationRequests: [request])
        
        controller?.delegate = self
        controller?.presentationContextProvider = self
    }


    func connection() {
        controller?.performRequests()
    }

    func disconnection() {
    }
    
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return presentVC.view.window!
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // 기존로직 - 에러처리 없음
        print(error)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credenticate = authorization.credential as? ASAuthorizationAppleIDCredential,
              let token = credenticate.identityToken else { return }
        
        
        guard let accessToken = String(data: token, encoding: .ascii) else { return }
        
        let userId = credenticate.user
        let email = credenticate.email ?? ""
        let fullName = "\(credenticate.fullName?.familyName ?? "")\(credenticate.fullName?.givenName ?? "")"
        let gender = ""
            
             
        self.callCompletion(with:
                                User()
        )
        
        
    }
}

