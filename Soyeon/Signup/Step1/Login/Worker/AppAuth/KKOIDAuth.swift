//
//  KKOIDAuth.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import KakaoSDKAuth
import KakaoSDKUser

struct KKOIDAuth: AuthInfo {
    var clientID = SoyeonPrivateInfo.kakaoClientKey
    
    func request(_ completion: @escaping Completion) {
        connectKakao(completion)
    }
     
    private func connectKakao(_ completion: @escaping Completion) {
        typealias KKOCompletionType = (OAuthToken?, Error?) -> Void
        let excute: KKOCompletionType = { (token, error) in
            if let error = error {
                completion(.failure(.thirdParty(error)))
                return
            }
            
            completion(.success(token?.accessToken))
        }
    
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk(completion: excute)
        }
        
        UserApi.shared.loginWithKakaoAccount(completion: excute)
        
    }
 
    private func disconnectKakao() {
        UserApi.shared.unlink { _ in  }
    }

    /// 카카오 로그인 사용자 정보 가져오기
//    private func getKakaoUserInfo() {
//        UserApi.shared.me { (user, error) in
//            if let error = error {
//                print("❌ getKakaoUserInfo() error: \(error)")
//            } else {
//                print("✅ me() success")
//                // 회원번호 값: user.id
//                // 카카오계정 프로필 정보: user.kakaoAccount.profile
//                // 이메일: user.kakaoAccount.email
//                _ = user
//            }
//        }
//    }
}

extension KKOIDAuth {
    /// Will use at method application delegate: openURL
    @discardableResult
    static func handle(with openUrl: URL) -> Bool {
        if AuthApi.isKakaoTalkLoginUrl(openUrl) {
            return AuthController.handleOpenUrl(url: openUrl)
        }
        
        return false
    }
}
