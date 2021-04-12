//
//  ProviderManager.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import Moya

protocol Reqeustable {
    static func reqeust<Model: Decodable>(_ target: Soyeon,
                                          _ model: Model.Type,
                                          completion: @escaping (Model) -> Void,
                                          failer: @escaping (Error?) -> Void)

}

let provider = MoyaProvider<Soyeon>(plugins: [NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))])

final class ProviderManager: Reqeustable {

    static func reqeust<Model: Decodable>(_ target: Soyeon,
                                          _ model: Model.Type,
                                          completion: @escaping (Model) -> Void,
                                          failer: @escaping (Error?) -> Void) {

        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                if let result = try? response.map(model) {
                    completion(result)
                } else if let serviceError = ServiceError(rawValue: response.statusCode) {
                    print(serviceError.description)
                    failer(serviceError as? Error)
                } else {
                    failer(ResponseError.failDecode)
                }

            case .failure(let error):
                failer(error)
            }

            return
        }
    }
}
