//
//  PhaseViewController.swift
//  Soyeon
//
//  Created by junyng on 2021/02/11.
//  Copyright © 2021 ludus. All rights reserved.
//

import SwiftyGif
import UIKit

final class PhaseViewController: UIViewController {
    
    enum Phase {
        case first(nickname: String)
        
        var imageName: String {
            switch self {
            case .first:
                return "phase_first"
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
    
    init(phase: Phase) {
        self.phase = phase
        super.init(nibName: "PhaseViewController", bundle: Bundle.main)
    }
    
    required init?(coder: NSCoder) {
        phase = .first(nickname: "")
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateGIF()
    }
    
    private func setupLayout() {
        phaseImageView.image = UIImage(named: phase.png)
        headerLabel.attributedText = phase.attributedString
    }
    
    private func animateGIF() {
        if let gif = try? UIImage(gifName: phase.gif) {
            imageView.setGifImage(gif, loopCount: 1)
            imageView.startAnimatingGif()
        }
    }
    
    @IBAction func didTapNextPhaseButton(_ sender: Any) {

    }
}

private extension PhaseViewController.Phase {
    var attributedString: NSAttributedString {
        switch self {
        case .first(let nickname):
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
        }
    }
}
