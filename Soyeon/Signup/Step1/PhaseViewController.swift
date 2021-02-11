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
        
        var gifName: String {
            switch self {
            case .first:
                return "phase_first.gif"
            }
        }
    }
    
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    var phase: Phase?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateGIF()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        headerLabel.attributedText = phase?.attributedString
    }
    
    private func animateGIF() {
        if let gifName = phase?.gifName,
           let gif = try? UIImage(gifName: gifName) {
            imageView.setGifImage(gif, loopCount: 1)
            imageView.startAnimatingGif()
        }
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
