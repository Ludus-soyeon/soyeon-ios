//
//  APIDAuth.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/11.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import AuthenticationServices

// TODO: project file -> '+' -> append 'Sign in with Apple'
final class APIDAuth: NSObject, AuthInfo { 
    var appleIDProvider = ASAuthorizationAppleIDProvider()
    lazy var request = appleIDProvider.createRequest()
    lazy var controller: ASAuthorizationController = ASAuthorizationController(authorizationRequests: [request])
    
    var completion: Completion?
      
    override init() {
        super.init()
        request.requestedScopes = [.fullName, .email]
        controller.delegate = self
        controller.presentationContextProvider = self
    }
       
    func request(success: @escaping Success, failer: Fail?) {
        completion = (success, failer)
    }
     
}

extension APIDAuth: ASAuthorizationControllerDelegate {
}

extension APIDAuth: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.soyeonWindow
    }
 
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let credenticate = authorization.credential as? ASAuthorizationAppleIDCredential else {
            completion?.failer?(.thirdParty(nil))
            return
        }
        
        guard let token = credenticate.identityToken,
              let tokenString = String(data: token, encoding: .ascii) else {
            completion?.failer?(.notToken)
            return
        }
          
        completion?.success(tokenString)
         
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithError error: Error) {
        completion?.failer?(.thirdParty(error))
    }
}
