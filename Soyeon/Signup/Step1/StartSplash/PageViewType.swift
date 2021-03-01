//
//  PageViewEnum.swift
//  Soyeon
//
//  Created by 박은비 on 2021/01/10.
//  Copyright © 2021 ludus. All rights reserved.
//

import UIKit

private protocol PageViewProtocol: CaseIterable {
    static var views: [UIView] { get }
    var viewNames: [String] { get }
    func loadViews() -> [UIView]
}

public enum PageViewType {
    enum StartSplashViews: String, PageViewProtocol {
        static var views: [UIView] {
            return Self.findInfoView.loadViews()
        }
        
        case findInfoView
        case myChareactorInfoView
        case coupleInfoView
    } 
}

extension PageViewProtocol {
    
    fileprivate var viewNames: [String] {
        Self.allCases.map {
            let name = String(describing: $0)
            let etcIndex: String.Index = name.index(name.startIndex, offsetBy: 1)
            
            return name[name.startIndex].uppercased() + name[etcIndex...]
        }
    }
    
    fileprivate func loadViews() -> [UIView] {
        return viewNames.map {
            if let loadedNib = Bundle.main.loadNibNamed($0, owner: self, options: nil)?.first as? UIView {
                return loadedNib
            }
            return UIView()
        }
    }
}
