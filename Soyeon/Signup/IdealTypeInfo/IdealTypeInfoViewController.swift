//
//  IdealTypeInfoViewController.swift
//  Soyeon
//
//  Created by junyeong-cho on 2021/03/13.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

class IdealTypeInfoViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let personalityList = [
        "밝고 명량한 타입", "난스러운 츤데레 타입",
        "리더십 있고 화통한 타입", "시크한 귀염둥이",
        "내 사람에게만 따뜻", "둥글둥글 평화주의",
        "주변을 챙기는 분위기 메이커", "한결같은 스타일"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle("이상형 정보 수정하기")
    }
        
    private func setupLayout() {
        
    }
}

extension IdealTypeInfoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personalityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PersonalityInfoCell.reuseIdentifier, for: indexPath) as? PersonalityInfoCell else {
            fatalError()
        }
        
        let personality = personalityList[indexPath.row]
        cell.configure(title: personality)
        return cell
    }
}
