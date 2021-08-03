//
//  User.swift
//  Soyeon
//
//  Created by 박은비 on 2021/03/07.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
 
// MARK: - User
struct User: SignupDataStorable {
    var acquaintance: Acquaintance?
    var acquaintanceShy: Bool?
    var age: Int?
    var animal: Acquaintance?
    var animalID: Int?
    var bio, bodyShape, cigarette, company: String?
    var dormantAt, drink, education, elTime: String?
    var email, fcmToken, frozenAt, frozenUntil: String?
    var height: Int?
    var hobby: String?
    var id, idealAgeEnd, idealAgeStart: Int?
    var idealBodyShape: String?
    var idealHeightEnd, idealHeightStart: Int?
    var idealTypeGroups, interest, lastAccess, location1: String?
    var location2, name, nickName: String?
    var oauthGoogleID, oauthKakaoID, oauthNaverID: Int?
    var occupation: String?
    var occupationConfirmed: Bool?
    var occupationConfirmedAt, phone: String?
    var phoneRegistered: Bool?
    var pictures: String?
    var rate: Int?
    var ratingRequired: Bool?
    var registeredAt: String?
    var registrationConfirmed: Bool?
    var registrationConfirmedAt, registrationPhase, religion: String?
    var sex: Bool?
    var speciality: String?

    enum CodingKeys: String, CodingKey {
        case acquaintance
        case acquaintanceShy = "acquaintance_shy"
        case age, animal
        case animalID = "animal_id"
        case bio
        case bodyShape = "body_shape"
        case cigarette, company
        case dormantAt = "dormant_at"
        case drink, education
        case elTime = "el_time"
        case email
        case fcmToken = "fcm_token"
        case frozenAt = "frozen_at"
        case frozenUntil = "frozen_until"
        case height, hobby, id
        case idealAgeEnd = "ideal_age_end"
        case idealAgeStart = "ideal_age_start"
        case idealBodyShape = "ideal_body_shape"
        case idealHeightEnd = "ideal_height_end"
        case idealHeightStart = "ideal_height_start"
        case idealTypeGroups = "ideal_type_groups"
        case interest
        case lastAccess = "last_access"
        case location1, location2, name
        case nickName = "nick_name"
        case oauthGoogleID = "oauth_google_id"
        case oauthKakaoID = "oauth_kakao_id"
        case oauthNaverID = "oauth_naver_id"
        case occupation
        case occupationConfirmed = "occupation_confirmed"
        case occupationConfirmedAt = "occupation_confirmed_at"
        case phone
        case phoneRegistered = "phone_registered"
        case pictures, rate
        case ratingRequired = "rating_required"
        case registeredAt = "registered_at"
        case registrationConfirmed = "registration_confirmed"
        case registrationConfirmedAt = "registration_confirmed_at"
        case registrationPhase = "registration_phase"
        case religion, sex, speciality
    }
}

struct Acquaintance: Codable { }

struct Animal: Codable { }
