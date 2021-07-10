//
//  PhaseViewController.swift
//  Soyeon
//
//  Created by junyng on 2021/02/11.
//  Copyright © 2021 ludus. All rights reserved.
//

import SwiftyGif
import UIKit
 
final class PhaseViewController: SignupStepViewController<User> {
    override var className: String {
        "\(self.phase.rawValue).\(super.className)"
    }
    
    enum Phase: String {
        case first
        case second
        
        var buttonTitle: String {
            switch self {
            case .first:
                return "프로필 작성하기"
            case .second:
                return "캐릭터 검사하고 소연 시작하기"
            }
        }
        
        var imageName: String {
            return "phase_first"
        }
        
        var gif: String { "\(imageName).gif" }
        var png: String { "\(imageName).png" }
    }
     
    @IBOutlet private weak var phaseImageView: UIImageView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var button: UIButton!
    
    private var phase: Phase
    
    private var nickname: String {
        return SYDefaultObject.user?.nickName ?? ""
    }
    
    init(phase: Phase) {
        self.phase = phase
        super.init(nibName: "PhaseViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        self.phase = .first
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        animateGIF()
    }
     
    private func setupLayout() {
        phaseImageView.image = UIImage(named: phase.png)
        headerLabel.attributedText = attributedString
        button.setTitle(phase.buttonTitle, for: .normal)
    }
    
    private func animateGIF() {
        if let gif = try? UIImage(gifName: phase.gif) {
            imageView.setGifImage(gif, loopCount: 1)
            imageView.startAnimatingGif()
        }
    }
    
    private func moveToStep2() {
        dismiss(animated: true, completion: {
            let rootNavigation = UIApplication.shared.soyeonWindow?.rootViewController as? UINavigationController
            let navigation = Signup.step2(.writeProfile1).loadedStep
            navigation.modalPresentationStyle = .fullScreen
            
            rootNavigation?.present(navigation,
                                    animated: true, completion: nil) 
        })
        
    }
    
    private func moveToStep3() {
        dismiss(animated: true, completion: nil)
    }
      
    @IBAction func didTapNextPhaseButton(_ sender: Any) {
        switch phase {
        case .first:
            moveToStep2()
        case .second:
            moveToStep3()
        }
    }
}

private extension PhaseViewController {
    var attributedString: NSAttributedString? {
        switch self.phase {
        case .first:
            return makeAttributedString(content: "\(nickname)님\n환영합니다!",
                                        bold: nickname)
        case .second:
            return makeAttributedString(content: "프로필 작성 완료! \n나의 캐릭터는 무엇일까요?",
                                        bold: "프로필 작성 완료!")
        }
    }
    
    private func makeAttributedString(content: String,
                                      bold: String) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(
            string: content,
            attributes: [
                .font: Fonts.nanumSquareR.size(20.0),
                .foregroundColor: Colors.strongBlack.color()
            ]
        )
        let range = (content as NSString).range(of: bold)
        attributedString.setAttributes(
            [
                .font: Fonts.nanumSquareB.size(20.0)
            ],
            range: range
        )
        
        return attributedString
    }
}
