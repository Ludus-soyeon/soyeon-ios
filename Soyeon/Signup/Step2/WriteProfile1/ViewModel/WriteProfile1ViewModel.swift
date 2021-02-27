//
//  WriteProfile1.swift
//  Soyeon
//
//  Created by 박은비 on 2021/02/18.
//  Copyright (c) 2021 ludus. All rights reserved.
//

import UIKit

enum WriteProfile1 {
    struct WriteProfile1 {
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
    
    struct Request {
    }
    
    struct Response {
    }
    
    struct WriteProfile1ViewModel {
        var profile: WriteProfile1?
    }
}

extension WriteProfile1.WriteProfile1 {
    var completed: Bool {
        return birthYear?.isEmpty ?? false &&
            education?.isEmpty ?? false &&
            job?.isEmpty ?? false &&
            location1?.isEmpty ?? false &&
            location2?.isEmpty ?? false &&
            height?.isEmpty ?? false &&
            form?.isEmpty ?? false &&
            religion?.isEmpty ?? false &&
            smoked?.isEmpty ?? false &&
            drink?.isEmpty ?? false
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
        if let job = birthYear { return job }
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
}
