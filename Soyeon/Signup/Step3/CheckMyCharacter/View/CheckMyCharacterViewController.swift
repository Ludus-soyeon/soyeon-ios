//
//  CheckMyCharacterViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/05/26.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol CheckMyCharacterViewControllerInput: CheckMyCharacterPresenterOutput {

}

protocol CheckMyCharacterViewControllerOutput {

    func doSomething()
}

final class CheckMyCharacterViewController: UIViewController {

    var output: CheckMyCharacterViewControllerOutput!
    var router: CheckMyCharacterRouterProtocol!
 
    // MARK: - Initializers

    init(configurator: CheckMyCharacterConfigurator = CheckMyCharacterConfigurator.shared) {

        super.init(nibName: nil, bundle: nil)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {

        super.init(coder: aDecoder)

        configure()
    }
 
    // MARK: - Configurator

    private func configure(configurator: CheckMyCharacterConfigurator = CheckMyCharacterConfigurator.shared) {

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
 
// MARK: - CheckMyCharacterPresenterOutput

extension CheckMyCharacterViewController: CheckMyCharacterViewControllerInput {
 
    // MARK: - Display logic

    func displaySomething(viewModel: CheckMyCharacterViewModel) {
        
    }
}
