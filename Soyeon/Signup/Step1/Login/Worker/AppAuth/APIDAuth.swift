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
       
    func request(_ completion: @escaping Completion) {
        self.completion = completion
        controller.performRequests()
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
            completion?(.failure(.failLogin))
            return
        }
        
        guard let identityToken = credenticate.identityToken else {
            completion?(.failure(.failLogin))
            return
        }
        
        let tokenString = String(data: identityToken,
                                 encoding: .ascii)
          
        completion?(.success(tokenString))
         
    }
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithError error: Error) {
        completion?(.failure(.thirdParty(error)))
    }
}
