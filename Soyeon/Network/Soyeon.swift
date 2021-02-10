//
//  Soyeon.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/02/11.
//  Copyright © 2021 ludus. All rights reserved.
//

import Moya
import Foundation

enum Soyeon {
    // Signup Service
    case removePhoneAuth
    case agreeTerms(ids: [Int])
    case checkDuplicateNickname(nickname: String)
    case smsAuth(key: String,
                 value: Int)
    case dryAuth
    case googleLogin(token: String)
    case kakaoLogin(token: String)
    case naverLogin(token: String)
}


extension Soyeon: TargetType {
    public var baseURL: URL { return URL(string: "")! }
    public var path: String {
        switch self {
        case .removePhoneAuth:
            return "/users/phone"
        case .agreeTerms:
            return "/terms"
        case .checkDuplicateNickname(let nickname):
            return "/users/nickname/\(nickname)"
        case .smsAuth:
            return "/sms/auth"
        case .dryAuth:
            return "/sms/auth/dry"
        case .googleLogin:
            return "/oauth/google"
        case .kakaoLogin:
            return "/oauth/kakao"
        case .naverLogin:
            return "/oauth/naver"
        }
    }
    public var method: Moya.Method {
        switch self {
        case .removePhoneAuth:
            return .get
        case .agreeTerms:
            return .post
        case .checkDuplicateNickname:
            return .get
        case .smsAuth, .dryAuth:
            return .post
        case .googleLogin, .kakaoLogin, .naverLogin:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .agreeTerms(let ids):
            var params: [String: Any] = [:]
            params["term_ids"] = ids
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .smsAuth(let key, let value):
            var params: [String: Any] = [:]
            params["auth_key"] = key
            params["auth_value"] = value
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        case .googleLogin(let token), .kakaoLogin(let token), .naverLogin(let token):
            var params: [String: Any] = [:]
            params["token"] = token
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        default:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var headers: [String : String]? {
        return nil
    }
}
