//
//  PastViewController.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/24/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class PastViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {

    @IBOutlet weak var pastCollectionView: UICollectionView!
    
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    let sectionInsets = UIEdgeInsets(top: 40.0, left: 0.0, bottom: 40.0, right: 40.0)
    let minInteritemSpacing : CGFloat = 0
    let minLineSpacing : CGFloat = 0
    
    var experiences = [ExperienceModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        //determine screen size 
        screenSize = UIScreen.mainScreen().bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        //declare navigation Bar
        var navBar = self.navigationController?.navigationBar
        
        if let nav = navBar {
            //set navBar style and title
            nav.barTintColor = UIColor(red:135.0/255.0, green:134.0/255.0, blue:173.0/255.0, alpha:1.0)
            nav.translucent = false
            nav.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Helvetica Neue", size: 23)!, NSForegroundColorAttributeName : UIColor.whiteColor()]
        }
        
        self.navigationItem.backBarButtonItem?.title = " "
        
        
        //get data from json into an array
        let filePath = NSBundle.mainBundle().pathForResource("ExperienceData",ofType:"json")
        var readError:NSError?
        let data = NSData(contentsOfFile: filePath!, options: NSDataReadingOptions.DataReadingUncached, error: &readError)
        let json = JSON(data: data!)
        //println(json)
        
        if let experienceArray = json["experience"].array {
            for expDict in experienceArray {
                var orgName: String? = expDict["orgName"].string
                var position: String? = expDict["position"].string
                var orgDescription: String? = expDict["orgDescription"].string
                var orgTimeline: String? = expDict["orgTimeline"].string
                var orgLocation: String? = expDict["orgLocation"].string
                var icon: String? = expDict["icon"].string
                
                var experience = ExperienceModel(orgName: orgName, position: position, orgDescription: orgDescription, orgTimeline: orgTimeline, orgLocation: orgLocation, icon: icon)
                experiences.append(experience)

            }
        }

    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //return number of items in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return experiences.count
    }
    
    
    //set cells
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let expCell: PastExperienceCollectionViewCell = pastCollectionView!.dequeueReusableCellWithReuseIdentifier("ExperienceCell", forIndexPath: indexPath) as! PastExperienceCollectionViewCell
        
        expCell.layer.cornerRadius = 8
        expCell.frame.size.width = (screenWidth / 2)
        expCell.frame.size.height = (screenHeight / 3)
        
        let experience = experiences[indexPath.row].orgName
        let image = experiences[indexPath.row].icon
        expCell.setExperienceCell(experience, orgImageText: image)
        
        expCell.backgroundColor = UIColor.whiteColor()

        
        return expCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return sectionInsets
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return minLineSpacing
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return minInteritemSpacing
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var experienceVC: ExperienceDetailViewController = segue.destinationViewController as! ExperienceDetailViewController
        
        let cell = sender as! PastExperienceCollectionViewCell
        let path = self.pastCollectionView!.indexPathForCell(cell)
        
        var selectedExp = path?.row
        
        println("Prepare for Segue: Item Selected: \(selectedExp!)")
        
        experienceVC.row = selectedExp
        experienceVC.experienceArray = experiences
    }

}
