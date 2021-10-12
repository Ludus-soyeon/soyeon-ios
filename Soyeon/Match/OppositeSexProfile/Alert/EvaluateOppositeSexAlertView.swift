//
//  EvaluateOppositeSexAlertView.swift
//  Soyeon
//
//  Created by 박은비 on 2021/10/12.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit
 
final class EvaluateOppositeSexAlertView: UIView, XibLoadable, Alertible {
    
    enum Evaluation {
        case back
        case evaluate(name: String)
    }
    
    typealias XibViewType = EvaluateOppositeSexAlertView
    
    @IBOutlet private weak var ratingView: OppositeSexRatingView!
    @IBOutlet private weak var messageLabel: UILabel!
    
    @IBOutlet internal weak var backgroundView: UIView!
    @IBOutlet internal weak var contentView: UIView!
     
    private var completion: ((Int) -> Void)?
    private var score: Int = 0
    
    private func clearUI() {
        messageLabel.text = ""
    }
    
    static private func prepare() -> XibViewType? {
        let view = EvaluateOppositeSexAlertView(frame: .zero)
      
        guard let alert = view.load() else {
            return nil
        }
        
        alert.clearUI()
        
        alert.ratingView.delegate = alert
        
        return alert
    }
    
    static func alert(on evaluation: Evaluation) -> XibViewType? {
        
        guard let alert = prepare()else {
            return nil
        }
         
        alert.messageLabel.text = evaluation.message
        
        return alert
    }
    
    static func alert(message: String) -> XibViewType? {
        
        guard let alert = prepare() else {
            return nil
        }
         
        alert.messageLabel.text = message
        
        return alert
    }
    @IBAction private func didTapEvaluateLaterButton(_ sender: UIButton) {
        
        self.completion?(score)
        
        dismiss()
        
    }
    
    func action(completion closure: @escaping (Int) -> Void ) -> Self {
        
        self.completion = closure
        
        return self
    }
    
}

extension EvaluateOppositeSexAlertView: RatingViewDelegate {
    
    func didChangeIndex(_ index: Int) {
        score = (index + 1)
    }
    
}

extension EvaluateOppositeSexAlertView.Evaluation {
    
    var message: String {
        switch self {
        case .back:
            return """
            호감도를 선택해주세요.
            호감도를 선택하시면 포인트가 지급됩니다.
            몇 점을 주었는지 상대에게 공개되지 않습니다.
            """
        case .evaluate(let name):
            return """
            \(name)님과의 만남은 어떠셨나요?
            소개팅 매너를 별점으로 선택해주세요.
            """
        }
    }
    
}

/// EvaluateOppositeSexAlertView애서 사용하는 Rating View
final class OppositeSexRatingView: RatingView {
    
    override func configureImageView(image baseImage: UIImage?, highlightedImage highlight: UIImage?) -> UIImageView {
        let imageView = super.configureImageView(image: baseImage, highlightedImage: highlight)
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
}
