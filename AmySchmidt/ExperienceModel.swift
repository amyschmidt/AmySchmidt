//
//  ExperienceModel.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/25/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class ExperienceModel: NSObject {
   
    let orgName: String
    let position : String
    let orgDescription: String
    let orgTimeline: String
    let orgLocation: String

    init(orgName: String?, position: String?, orgDescription : String?, orgTimeline : String?, orgLocation : String?) {
        self.orgName = orgName ?? ""
        self.position = position ?? ""
        self.orgDescription = orgDescription ?? ""
        self.orgTimeline = orgTimeline ?? ""
        self.orgLocation = orgLocation ?? ""
    }
    
}
