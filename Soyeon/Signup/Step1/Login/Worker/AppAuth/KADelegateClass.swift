//
//  KADelegateClass.swift
//  Soyeon
//
//  Created by 박은비 on 2021/06/25.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


final class KADelegateClass: NSObject, GJSocialLoginDelegate {
    var completion: (User)->Void
    
    private var presentVC: UIViewController
    private lazy var session: KOSession? = .shared()
    
    private var clientKey: String {
        return "f5a558f08033d4308bf204e88cfc866e"
    }
     
      
    init(presentVC: UIViewController,
         completion: @escaping (Regist)->Void) {
        self.presentVC = presentVC
        self.completion = completion
        super.init()
    }
    
    private func handle(with openUrl: URL) {
        if AuthApi.isKakaoTalkLoginUrl(openUrl) {
            _ = AuthController.handleOpenUrl(url: openUrl)
        }
    }
    
    func setup() {
        KakaoSDKCommon.initSDK(appKey: kakaoAppKey)
    }
     
    func connection() {
        
        if AuthApi.isKakaoTalkLoginUrl(openUrl) {
            _ = AuthController.handleOpenUrl(url: openUrl)
        }
        
        if AuthApi.isKakaoTalkLoginAvailable() {
            AuthApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                if let error = error {
                    print("❌ loginWithKakaoTalk error: \(error)")
                } else {
                    print("✅ loginWithKakaoTalk success")
                    _ = oauthToken
                }
            }
        } else {
            AuthApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print("❌ loginWithKakaoAccount error: \(error)")
                } else {
                    print("✅ loginWithKakaoAccount success")
                    print("oauthtoken: \(String(describing: oauthToken))")
                }
            }
        }
    }
    
    func disconnection() {
        UserApi.shared.unlink { (error) in
            if let error = error {
                print("❌ disconnectKakao error: \(error)")
            } else {
                print("✅ unlink() success")
            }
        }
    }
    
    /// 카카오 로그인 사용자 정보 가져오기
    private func getKakaoUserInfo() {
        UserApi.shared.me { (user, error) in
            if let error = error {
                print("❌ getKakaoUserInfo() error: \(error)")
            } else {
                print("✅ me() success")
                // 회원번호 값: user.id
                // 카카오계정 프로필 정보: user.kakaoAccount.profile
                // 이메일: user.kakaoAccount.email
                _ = user
            }
        }
    }
    
} 
