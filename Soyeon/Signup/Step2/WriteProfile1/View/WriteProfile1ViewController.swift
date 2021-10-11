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
    func completedText(_ type: WriteProfileAlertViewModel.WriteProfileItem?,
                       _ input: String?,
                       request: WriteProfile1Model.ViewModel)
}

final class WriteProfile1ViewController: SignupStepViewController<WriteProfile1Model.ViewModel> {
    
    private var viewModel: WriteProfile1Model.ViewModel = WriteProfile1Model.ViewModel() {
        willSet { viewData = newValue }
    }
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         
        doWriteProfileOnLoad(request: viewData)
    }
     
    // MARK: - Load data
    private func doWriteProfileOnLoad(_ type: WriteProfileAlertViewModel.WriteProfileItem? = nil,
                                      _ input: String? = nil,
                                      request: WriteProfile1Model.ViewModel) {
        output.completedText(type, input, request: request)
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
    private func completion(type: WriteProfileAlertViewModel.WriteProfileItem,
                            input: String) {
 
        doWriteProfileOnLoad(type, input, request: viewModel)

        if type != .drink {
            let button = UIButton()
            button.tag = type.rawValue + 1
                
            profileItemButtonDidTap(sender: button)
        }
    }
    
    @IBAction private func nextButtonDidTap(sender: UIButton) {
        router.navigationToWriteIntroduction()
    }
    
    @IBAction private func profileItemButtonDidTap(sender: UIButton) {
        guard let item = WriteProfileAlertViewModel.WriteProfileItem(rawValue: sender.tag) else {
            return
        }
        
        showWriteProfile(item)
    
    }
    
    private func showWriteProfile(_ writeProfile: WriteProfileAlertViewModel.WriteProfileItem) {
        
        guard let alert = WriteProfileAlertView.alert(title: writeProfile.title) else {
            return
        }
            
        alert.action(style: writeProfile, completion: { selection in
            
            guard let selection = selection else { return }
            
            self.completion(type: writeProfile,
                            input: selection)
            
            alert.dismiss()
        })
        .show(to: self.navigationController!.view)
        
    }
}
 
// MARK: - WriteProfile1PresenterOutput
extension WriteProfile1ViewController: WriteProfile1ViewControllerInput { 
    
    // MARK: - Display logic
    func displayWriteProfileOnLoad(response: WriteProfile1Model.ViewModel) {
        viewModel = response
        
        birthLabel.text      = response.birthyearPlaceHold
        educationLabel.text  = response.educationPlaceHold
        jobLabel.text        = response.jobPlaceHold
        location1Label.text  = response.location1PlaceHold
        location2Label.text  = response.location2PlaceHold
        heightLabel.text     = response.heightPlaceHold
        formLabel.text       = response.formPlaceHold
        religionLabel.text   = response.religionPlaceHold
        smokedLabel.text     = response.smokedPlaceHold
        drinkLabel.text      = response.drinkPlaceHold
        
        isEnabledNextButton(response.completed)
    }
}
  
