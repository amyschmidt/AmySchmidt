//
//  AboutMeDetailViewController.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/25/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class AboutMeDetailViewController: UIViewController {

    let testData = ["Coding", "Music", "Fashion", "Cooking", "Traveling"]
    
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //declare navigation Bar
        var navBar = self.navigationController?.navigationBar
        
        if let nav = navBar {
            //set navBar style and title
            nav.barTintColor = UIColor(red:135.0/255.0, green:134.0/255.0, blue:173.0/255.0, alpha:1.0)
            nav.translucent = false
            nav.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Helvetica Neue", size: 23)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
            nav.backItem?.title = " "
            nav.tintColor = UIColor.whiteColor()
            
            
        }
        
        
        self.navigationItem.backBarButtonItem?.title = " "
        self.navigationItem.title = testData[row!]

    }

    

}
