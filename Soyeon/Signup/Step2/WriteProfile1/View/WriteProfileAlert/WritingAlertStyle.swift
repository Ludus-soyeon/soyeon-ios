//
//  WritingAlertStyle.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/21.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
import UIKit
 
struct WritingAlertStyle {
    enum AlertCustomButtonStyle {
        case birthYear
        case education
        case job
        case height
        case religion
        
        func view(action: @escaping (String?) -> Void) -> WriteProfileAlertCustomButton? {
            switch self {
            case .birthYear:
                return loadViews(action: action, type: BirthYearAlertItem.self)
            case .education:
                return loadViews(action: action, type: EducationAlertItem.self)
            case .job:
                return loadViews(action: action, type: JobAlertItem.self)
            case .height:
                return loadViews(action: action, type: HeightAlertItem.self)
            case .religion:
                return loadViews(action: action, type: ReligionAlertItem.self)
            }
        }

    }
    
    enum Action {
      case items([String])
      case custom(AlertCustomButtonStyle)
  }
}
 
extension WritingAlertStyle.AlertCustomButtonStyle {
    private func loadViews<ViewType: WriteProfileAlertCustomButton>(action: @escaping (String?) -> Void,
                                                                    type: ViewType.Type) -> ViewType? {
        if let loadedNib = Bundle.main.loadNibNamed(WriteProfileAlertCustomButton.reuseIdentifier,
                                                    owner: self,
                                                    options: nil) {
       
            for view in loadedNib {
                if let view = view as? ViewType {
                    view.setActionClosure(action: action)
                    view.setDelegate()
                    view.setupLayout()
                    return view
                }
            }
        }
        return nil
    }
}
