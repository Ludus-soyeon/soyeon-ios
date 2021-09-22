//
//  WriteProfileAlertAction.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/22.
//  Copyright © 2021 ludus. All rights reserved.
//

import Foundation
 
extension WriteProfileAlertViewModel.WriteProfileItem {
    
    private var editor: [WriteProfileAlertViewModel.WriteProfileItem] {
        [.birthYear, .education, .job, .height, .religion]
    }
     
    var isEditer: Bool {
        editor.contains(self)
    }
     
    var isSelection: Bool {
        let notEditor = Set(AllCases()).subtracting(Set(editor))
        return Array(notEditor).contains(self)
    }
    
    func view(action: @escaping (String?) -> Void) -> WriteMyProfileAlertView? {
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
        default:
            return nil
        }
    }
    
    private func loadViews<ViewType: WriteMyProfileAlertView>(action: @escaping (String?) -> Void,
                                                              type: ViewType.Type) -> ViewType? {
        if let loadedNib = Bundle.main.loadNibNamed("WriteProfileAlertCustomButton",
                                                    owner: self,
                                                    options: nil) {
            
            for view in loadedNib {
                if let view = view as? ViewType {
                    view.actionClosure = action
                    view.setDelegate()
                    view.setupLayout()
                    return view
                }
            }
        }
        return nil
    }
}
