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
        doWriteProfileOnLoad()
    }
     
    // MARK: - Load data
    private func doWriteProfileOnLoad() {
        output.doSomething()
    }
    
    private func setupLayout() {
        setNavigationTitle("프로필 작성하기")
        nextButton.setRadius(23)
    }
  
    private func isEnabledNextButton(_ isEnabled: Bool) {
        nextButton.isEnabled = isEnabled
        
        if isEnabled {
            nextButton.setTitleColor(UIColor.white, for: .normal)
            nextButton.backgroundColor = Colors.soyeonBlue.color()
            return
        }
        nextButton.setTitleColor(#colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), for: .normal)
        nextButton.backgroundColor = Colors.buttonDisabled.color()
    }
    
    @IBAction private func nextButtonDidTap(sender: UIButton) {
        print("nextButtonDidTap")
    }
    
    @IBAction private func profileItemButtonDidTap(sender: UIButton) {
        guard let writeProfileItem = WriteProfileAlertViewModel.WriteProfileItem(rawValue: sender.tag) else {
            return
        }
    
        writeProfileItem
            .alert(action: { [weak self] in
                self?.completion(type: writeProfileItem,
                                 test: $0)
            })
            .show(to: view!)
    }
    
    private func completion(type: WriteProfileAlertViewModel.WriteProfileItem,
                            test: String?) {

        // 모델과 입력받은 값을 갖고 interactor로
        //

        if type != .drink {
            let button = UIButton()
            button.tag = type.rawValue + 1
                
            profileItemButtonDidTap(sender: button)
        }
    }
}
 
// MARK: - WriteProfile1PresenterOutput
extension WriteProfile1ViewController: WriteProfile1ViewControllerInput {
    
    // MARK: - Display logic
    func displayWriteProfileOnLoad(viewModel: WriteProfile1.WriteProfile1ViewModel) {
        if let profile = viewModel.profile {
            birthLabel.text      = profile.birthyearPlaceHold
            educationLabel.text  = profile.educationPlaceHold
            jobLabel.text        = profile.jobPlaceHold
            location1Label.text  = profile.location1PlaceHold
            location2Label.text  = profile.location2PlaceHold
            heightLabel.text     = profile.heightPlaceHold
            formLabel.text       = profile.formPlaceHold
            religionLabel.text   = profile.religionPlaceHold
            smokedLabel.text     = profile.smokedPlaceHold
            drinkLabel.text      = profile.drinkPlaceHold
            
            isEnabledNextButton(profile.completed)
        }
    }
}
  
