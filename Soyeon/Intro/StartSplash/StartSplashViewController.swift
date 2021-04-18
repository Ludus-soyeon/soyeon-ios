//
//  NewStartSplashViewController.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/17.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import UIKit

final class StartSplashViewController: UIViewController {
    @IBOutlet private weak var pageView: PagingView!
    @IBOutlet private weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 24.0
        pageView.setItems(PageViewType.StartSplashViews.views)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // todo: - 화면이 완전히 넘어간 뒤 하기 문 진행
        MarqueeScrollView.timer?.invalidate()
        MarqueeScrollView.timer = nil
    }
 
    @IBAction private func startButtonDidTap(_ sender: Any?) {
        if let location = UserDefaults.object(forKey: .saveSignUpLocation) as? String {
            continueSignupAlert(location)
            return
        }
          
        startSignupAlert()
    }
    
    private func startSignupAlert() {
        SoyeonRoundAlertView
            .alert(message: "당신은 법적 싱글이십니까? 법적 싱글이 아닐 경우 법적 처벌을 받을 수 있으며 소연에서는 이에 대한 책임을 지지 않습니다.")?
            .action(style: .basic("동의합니다"), completion: { [weak self] _ in
                self?.startSignup()
            })
            .show(to: self.view!, completion: nil)
    }
    
    private func continueSignupAlert(_ location: String) {
        SoyeonRoundAlertView
            .alert(message: "이전에 진행 중인 회원가입 기록이 있습니다. 이어서 계속 하시겠습니까?")?
            .action(style: .other("처음부터 다시하기"), completion: { [weak self] _ in
                self?.removeViewData() 
                self?.startSignupAlert()
            })
            .action(style: .basic("이어서 계속하기"), completion: { [weak self] _ in
                self?.continueSignup(location)
            })
            .show(to: self.view!, completion: nil)
    }
    
    private func startSignup() {
        let navigation = Signup.step1(.login).loaded 
        setViewControllers(navigation.viewControllers)
    }
    
    private func continueSignup(_ location: String) {
        if let saveSignupLocation: Signup = Signup.stringToInit(value: location) {
            let navigation = saveSignupLocation.loaded
            setViewControllers(navigation.viewControllers)
            return
        }
        startSignup()
    }
    
    private func setViewControllers(_ viewContrllers: [UIViewController]) {
        navigationController?.setViewControllers(viewContrllers, animated: true)
    }
    
    private func removeViewData() {
        UserDefaults.remove(forKey: .saveSignUpLocation)
        
        let dictionary = UserDefaults.standard.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            UserDefaults.standard.removeObject(forKey: key)
        }
        
    }
}
  
