//
//  ObjectUserDefaultPropertyWrapper.swift
//  Soyeon
//
//  Created by 박은비 on 2021/07/11.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
  
@propertyWrapper
struct ObjectUserDefaultWrapper<ViewDataType: Codable> {
    let key: SoyeonUserDefaultKey
    let dataType: ViewDataType.Type
    
    var wrappedValue: ViewDataType? {
        get {
            return defaultViewData(ViewDataType.self)
        }
        
        set {
            putDefaultViewData(newValue)
        }
    }
    
    private func putDefaultViewData<ViewDataType: Codable>(_ viewModel: ViewDataType) {
        let encode = JSONEncoder()
        let data = try? encode.encode(viewModel)
        UserDefaults.standard.setValue(data, forKey: key.rawValue)
    }
    
    private func defaultViewData<ViewDataType: Codable>(_ viewModel: ViewDataType.Type) -> ViewDataType? {
        if let value = UserDefaults.standard.object(forKey: key.rawValue) as? Data {
            let decode = JSONDecoder()
            if let data = try? decode.decode(viewModel, from: value) {
                return data
            }
        }
        return nil
    }
    
}
 
