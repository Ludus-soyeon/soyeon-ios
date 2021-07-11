//
//  AppAuthorizable.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import AppAuth

/// AppAuth Wrapper
protocol AppAuthorizable: AuthInfo {
    var clientID: String { get }
    
    var issuer: URL { get }
    var clientSecret: String { get }
    var redirectURI: URL { get }
    
    var presenter: UIViewController { get set }
}
  
extension AppAuthorizable {
    private func makeRequest(to configuration: OIDServiceConfiguration) -> OIDAuthorizationRequest {
        return OIDAuthorizationRequest(configuration: configuration,
                                       clientId: clientID,
                                       clientSecret: clientSecret,
                                       scopes: [OIDScopeOpenID, OIDScopeProfile],
                                       redirectURL: redirectURI,
                                       responseType: OIDResponseTypeCode,
                                       additionalParameters: nil)
    }
    
    private func configure(_ completion: @escaping (OIDAuthorizationRequest) -> Void,
                           failer: @escaping (Error?) -> Void) {
        OIDAuthorizationService.discoverConfiguration(forIssuer: issuer) { config, error in
            guard let config = config else {
                failer(error)
                return
            }
            let request = self.makeRequest(to: config)
            completion(request)
        }
    }
    
    func request(_ completion: @escaping Completion) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        configure { result in
         
            appDelegate!.currentAuthorizationFlow =
                OIDAuthState.authState(byPresenting: result,
                                       presenting: presenter) { authState, error in
                    if let error = error {
                        completion(.failure(.thirdParty(error)))
                        return
                    }
                     
                    completion(.success(authState?.lastTokenResponse?.accessToken))
                }
            
        } failer: { error in
            completion(.failure(.thirdParty(error)))
        }

    }
    
}
