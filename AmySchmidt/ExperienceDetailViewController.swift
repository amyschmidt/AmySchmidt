//
//  ExperienceDetailViewController.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/24/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class ExperienceDetailViewController: UIViewController {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var timelineLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    var experienceArray : [ExperienceModel]?
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //declare navigation Bar
        var navBar = self.navigationController?.navigationBar
        
        if let nav = navBar {
            //set navBar style and title
            nav.barTintColor = UIColor(red:135.0/255.0, green:134.0/255.0, blue:173.0/255.0, alpha:1.0)
            nav.translucent = false
            nav.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Helvetica Neue", size: 18)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
            nav.backItem?.title = " "
            nav.tintColor = UIColor.whiteColor()

            
        }
        
        self.navigationItem.backBarButtonItem?.title = " "
        descriptionLabel.numberOfLines = 0

        //set dynamic data
        if let array = experienceArray {
            if let element = row {
                self.navigationItem.title = array[element].orgName
                positionLabel.text = array[element].position
                timelineLabel.text = array[element].orgTimeline
                locationLabel.text = array[element].orgLocation
                descriptionLabel.text = array[element].orgDescription
            }
        }
       
    }


}
