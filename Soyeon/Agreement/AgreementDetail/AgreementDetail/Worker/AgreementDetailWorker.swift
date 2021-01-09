//
//  AgreementDetailWorker.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

class AgreementDetailWorker {
 
    // MARK: - Business Logic
    func contentForDetailType(_ detailType: AgreementDetail.AgreementDetailType) -> String {
        switch detailType {
        case .privacy, .marketing:
            return DetailContents().privacy
        case .service:
            return DetailContents().service
        }
    }
}
