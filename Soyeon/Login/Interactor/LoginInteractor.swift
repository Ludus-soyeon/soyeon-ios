//
//  LoginInteractor.swift
//  Soyeon
//
//  Created by 이재은 on 2021/01/02.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol LoginInteractorInput: LoginViewControllerOutput {

}

protocol LoginInteractorOutput {
    func presentLogin(platform: [Login.Platform])
}

protocol LoginDataStore {
    var token: String? { get set }
}

final class LoginInteractor {

    private let output: LoginInteractorOutput
    private let worker: LoginWorker

    // MARK: - Initializers
    init(output: LoginInteractorOutput,
         worker: LoginWorker = LoginWorker()) {
        self.output = output
        self.worker = worker
    }
}

// MARK: - LoginInteractorInput
extension LoginInteractor: LoginViewControllerOutput {

    // MARK: - Business logic
    func displayLoginOnLoad() {
        let platforms: [Login.Platform] = [.naver, .kakao, .google, .apple]
        output.presentLogin(platform: platforms)
    }
}
