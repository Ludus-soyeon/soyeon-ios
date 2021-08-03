//
//  WriteProfile1.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

enum WriteProfile1Model {
    struct Request {
    }
    
    struct Response {
    }
    
    public struct ViewModel: SignupDataStorable {
        var birthYear: String?
        var education: String?
        var job: String?
        var location1: String?
        var location2: String?
        var height: String?
        var form: String?
        var religion: String?
        var smoked: String?
        var drink: String?
    }
}

extension WriteProfile1Model.ViewModel {
    var completed: Bool {
        return !(birthYear?.isEmpty ?? true) &&
            !(education?.isEmpty ?? true) &&
            !(job?.isEmpty ?? true) &&
            !(location1?.isEmpty ?? true) &&
            !(location2?.isEmpty ?? true) &&
            !(height?.isEmpty ?? true) &&
            !(form?.isEmpty ?? true) &&
            !(religion?.isEmpty ?? true) &&
            !(smoked?.isEmpty ?? true) &&
            !(drink?.isEmpty ?? true)
    }
    
    var birthyearPlaceHold: String {
        if let birthYear = birthYear { return birthYear }
        return WriteProfileAlertViewModel.WriteProfileItem.birthYear.title
    }
    
    var educationPlaceHold: String {
        if let education = education { return education }
        return WriteProfileAlertViewModel.WriteProfileItem.education.title
    }
    
    var jobPlaceHold: String {
        if let job = job { return job }
        return WriteProfileAlertViewModel.WriteProfileItem.job.title
    }
    
    var location1PlaceHold: String {
        if let location1 = location1 { return location1 }
        return WriteProfileAlertViewModel.WriteProfileItem.location1.title
    }
    
    var location2PlaceHold: String {
        if let location2 = location2 { return location2 }
        return WriteProfileAlertViewModel.WriteProfileItem.location2.title
    }
    
    var heightPlaceHold: String {
        if let height = height { return height }
        return WriteProfileAlertViewModel.WriteProfileItem.height.title
    }
    
    var formPlaceHold: String {
        if let form = form { return form }
        return WriteProfileAlertViewModel.WriteProfileItem.form.title
    }
    
    var religionPlaceHold: String {
        if let religion = religion { return religion }
        return WriteProfileAlertViewModel.WriteProfileItem.religion.title
    }
    
    var smokedPlaceHold: String {
        if let smoked = smoked { return smoked }
        return WriteProfileAlertViewModel.WriteProfileItem.smoked.title
    }
    
    var drinkPlaceHold: String {
        if let drink = drink { return drink }
        return WriteProfileAlertViewModel.WriteProfileItem.drink.title
    }
     
    mutating func inputAccordingToType(_ type: WriteProfileAlertViewModel.WriteProfileItem,
                                       input: String) {
        switch type {
        case .birthYear:
            birthYear       = input
        case .education:
            education       = input
        case .job:
            job             = input
        case .location1:
            location1       = input
        case .location2:
            location2       = input
        case .height:
            height          = input
        case .form:
            form            = input
        case .religion:
            religion        = input
        case .smoked:
            smoked          = input
        case .drink:
            drink           = input
        }
    }
} 
