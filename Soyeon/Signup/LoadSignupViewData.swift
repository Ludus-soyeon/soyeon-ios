//
//  LoadSignupViewData.swift
//  Soyeon
//
//  Created by 박은비 on 2021/04/18.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation

/// 회원가입의 데이터를 수정 및 조회합니다.
protocol LoadSignupViewData: AnyObject {
    associatedtype ViewDataType: Codable
    var step: Signup? { get set }
    
    func loadViewData() -> ViewDataType?
    func setViewData(_ data: ViewDataType)
}

extension LoadSignupViewData {
    private var storeData: ViewDataType? {
        get { return defaultViewData() }
        set {
            if let newValue = newValue {
                modifyDefaultViewData(newValue)
            }
        }
    }
    
    private var defaultKey: String {
        return step?.resource ?? ""
    }
    
    private func modifyDefaultViewData(_ viewModel: ViewDataType) {
        let encode = JSONEncoder()
        let data = try? encode.encode(viewModel)
        UserDefaults.standard.setValue(data, forKey: defaultKey)
    }
    
    private func defaultViewData() -> ViewDataType? {
        if let value = UserDefaults.standard.object(forKey: defaultKey) as? Data {
            let decode = JSONDecoder()
            if let data = try? decode.decode(ViewDataType.self, from: value) as ViewDataType {
                return data
            }
        }
        return UserDefaults.standard.object(forKey: defaultKey) as? ViewDataType
    }
}
 
extension LoadSignupViewData {
    func loadViewData() -> ViewDataType? {
        return storeData
    }
    
    func setViewData(_ data: ViewDataType) {
        storeData = data
    }
}
