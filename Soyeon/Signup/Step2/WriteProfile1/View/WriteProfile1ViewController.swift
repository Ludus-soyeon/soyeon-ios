//
//  WriteProfile1ViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

protocol WriteProfile1ViewControllerInput: WriteProfile1PresenterOutput {

}

protocol WriteProfile1ViewControllerOutput {
    func doSomething()
}

final class WriteProfile1ViewController: UIViewController {

    var output: WriteProfile1ViewControllerOutput!
    var router: WriteProfile1RouterProtocol!
   
    @IBOutlet private weak var birthLabel: UILabel!
    @IBOutlet private weak var educationLabel: UILabel!
    @IBOutlet private weak var jobLabel: UILabel!
    @IBOutlet private weak var location1Label: UILabel!
    @IBOutlet private weak var location2Label: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var formLabel: UILabel!
    @IBOutlet private weak var religionLabel: UILabel!
    @IBOutlet private weak var smokedLabel: UILabel!
    @IBOutlet private weak var drinkLabel: UILabel!
    
    @IBOutlet private weak var nextButton: UIButton!
     
    // MARK: - Initializers
    init(configurator: WriteProfile1Configurator = WriteProfile1Configurator.shared) {
        super.init(nibName: nil, bundle: nil)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: - Configurator
    private func configure(configurator: WriteProfile1Configurator = WriteProfile1Configurator.shared) {
        configurator.configure(viewController: self)
    }
 
    // MARK: - View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        doSomethingOnLoad()
    }
     
    private func setupLayout() {
        setNavigationTitle("프로필 작성하기")
        nextButton.setRadius(23)
    }
  
    @IBAction private func profileItemButtonDidTap(sender: UIButton) {
        
    }
    
    // MARK: - Load data

    func doSomethingOnLoad() {
        output.doSomething()
    }
}
 
// MARK: - WriteProfile1PresenterOutput

extension WriteProfile1ViewController: WriteProfile1ViewControllerInput {
  
    // MARK: - Display logic

    func displaySomething(viewModel: WriteProfile1.WriteProfile1ViewModel) {
        
    }
}
  
