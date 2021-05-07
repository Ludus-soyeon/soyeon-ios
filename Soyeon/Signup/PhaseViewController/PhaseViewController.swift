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
    
    enum Phase: String {
        case first
        case second
         
        var imageName: String {
            switch self {
            case .first:
                return "phase_first"
            default:
                return ""
            }
        }
        
        var gif: String {
            return "\(imageName).gif"
        }
        
        var png: String {
            return "\(imageName).png"
        }
    }
    
    @IBOutlet private weak var phaseImageView: UIImageView!
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    private var phase: Phase
    
    private var nickname: String {
        return getUserData().nickname ?? ""
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
     
    private func setupLayout() {
        phaseImageView.image = UIImage(named: phase.png)
        headerLabel.attributedText = attributedString
    
    }
    
    private func animateGIF() {
        if let gif = try? UIImage(gifName: phase.gif) {
            imageView.setGifImage(gif, loopCount: 1)
            imageView.startAnimatingGif()
        }
    }
      
    @IBAction func didTapNextPhaseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

private extension PhaseViewController {
    var attributedString: NSAttributedString? {
        switch self.phase {
        case .first:
            let title = "\(nickname)님\n환영합니다!"
            let attributedString = NSMutableAttributedString(
                string: title,
                attributes: [
                    .font: Fonts.nanumSquareR.size(20.0),
                    .foregroundColor: Colors.strongBlack.color()
                ]
            )
            let range = (title as NSString).range(of: nickname)
            attributedString.setAttributes(
                [
                    .font: Fonts.nanumSquareB.size(20.0)
                ],
                range: range
            )
            return attributedString
        default:
            return nil
        }
    }
}
