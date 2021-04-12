//
//  PhotoRegistrationViewController.swift
//  Soyeon
//
//  Created by 이재은 on 2021/02/07.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol PhotoRegistrationViewControllerInput: PhotoRegistrationPresenterOutput {

}

protocol PhotoRegistrationViewControllerOutput {

    func doSomething()
}

final class PhotoRegistrationViewController: UIViewController {

    var output: PhotoRegistrationViewControllerOutput!
    var router: PhotoRegistrationRouterProtocol!


    // MARK: - Initializers

    init(configurator: PhotoRegistrationConfigurator = PhotoRegistrationConfigurator.sharedInstance) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - Configurator

    private func configure(configurator: PhotoRegistrationConfigurator = PhotoRegistrationConfigurator.sharedInstance) {

        configurator.configure(viewController: self)
    }


    // MARK: - View lifecycle

    override func viewDidLoad() {

        super.viewDidLoad()

        doSomethingOnLoad()
    }


    // MARK: - Load data

    func doSomethingOnLoad() {

        output.doSomething()
    }
}


// MARK: - PhotoRegistrationPresenterOutput

extension PhotoRegistrationViewController: PhotoRegistrationViewControllerInput {


    // MARK: - Display logic

    func displaySomething(viewModel: PhotoRegistrationViewModel) {

    }
}
