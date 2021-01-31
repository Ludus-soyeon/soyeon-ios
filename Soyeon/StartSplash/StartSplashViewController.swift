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
        /* todo: - 화면 전환 작업
          - 알럿노출
            1. 당신은 법적 싱글이십니까?
            2. 이어서 회원가입 하시겠습니까?
        */
    }
 
}
