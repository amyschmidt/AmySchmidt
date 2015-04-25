//
//  ExperienceDetailViewController.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/24/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    var testData = ["University of Missouri"]

    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = testData[row!]
    }

    

}
