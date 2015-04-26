//
//  FutureModel.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/26/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class FutureModel: NSObject {
    
    let title: String
    let objDescription : String
    let icon: String
    
    init(title: String?, objDescription: String?, icon : String?) {
        self.title = title ?? ""
        self.objDescription = objDescription ?? ""
        self.icon = icon ?? ""

    }
    
}