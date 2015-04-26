//
//  FutureDetailViewController.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/25/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class FutureDetailViewController: UIViewController {


    @IBOutlet weak var futureImage: UIImageView!
    @IBOutlet weak var futureLabel: UILabel!
    
    var futuresArray : [FutureModel]?
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
        futureLabel.numberOfLines = 0
        
        //set dynamic data
        if let array = futuresArray {
            if let element = row {
                self.navigationItem.title = array[element].title
                futureLabel.text = array[element].objDescription
            }
        }

    }


}
