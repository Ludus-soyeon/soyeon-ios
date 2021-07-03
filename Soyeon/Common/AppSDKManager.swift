//
//  AppSDKManager.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import KakaoSDKCommon

protocol SDKSettable {
    var clientID: String { get }
    func active()
}

enum AppSDK: CaseIterable {
    case kakao
    
    func active() {
        let sdkSetting: SDKSettable
        switch self {
        case .kakao:
            sdkSetting = KKOSDK()
        }
        
        sdkSetting.active()
    }
}

// MARK: -
struct KKOSDK: SDKSettable {
    var clientID: String = SoyeonPrivateInfo.kakaoClientKey
    
    func active() {
        KakaoSDKCommon.initSDK(appKey: clientID)
    }
}
