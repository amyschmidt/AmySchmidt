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
    
    let testData = ["University of Missouri", "Microsoft Application Development Lab", "Department of Student Acvitities", "Progressus Media", "Monsanto", "Adaptive Computing Technology Center"]
    let testImages = ["UMC.png", "MADL.png", "DSA.png", "Progressus.png", "Monsanto.png", "ACT.png"]
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
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
        
        //set layout of collection view cell
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth/2, height: screenWidth/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        //get data from json into an array
        JSONData.getExperienceDataFromFileWithSuccess { (data) -> Void in
            let json = JSON(data: data)

            if let experienceArray = json["experience"].array {
                
            var experiences = [ExperienceModel]()
                
                for expDict in experienceArray {
                    var orgName: String? = expDict["orgName"].string
                    var position: String? = expDict["position"].string
                    var orgDescription: String? = expDict["orgDescription"].string
                    var orgTimeline: String? = expDict["orgTimeline"].string
                    var orgLocation: String? = expDict["orgLocation"].string
                
                    var experience = ExperienceModel(orgName: orgName, position: position, orgDescription: orgDescription, orgTimeline: orgTimeline, orgLocation: orgLocation)
                    experiences.append(experience)
                }
            }
        }

    }
    

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //return number of items in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    
    //set cells
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let expCell: PastExperienceCollectionViewCell = pastCollectionView.dequeueReusableCellWithReuseIdentifier("ExperienceCell", forIndexPath: indexPath) as! PastExperienceCollectionViewCell
        
        let experience = testData[indexPath.row]
        let image = testImages[indexPath.row]
        expCell.setExperienceCell(experience, orgImageText: image)
        
        expCell.backgroundColor = UIColor(red:52.0/255.0, green:152.0/255.0, blue:219.0/255.0, alpha:1.0)
        
        return expCell
    }
    
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var experienceVC: ExperienceDetailViewController = segue.destinationViewController as! ExperienceDetailViewController
        
        let cell = sender as! PastExperienceCollectionViewCell
        let path = self.pastCollectionView.indexPathForCell(cell)
        
        var selectedExp = path?.row
        
        println("Prepare for Segue: Item Selected: \(selectedExp!)")
        
        experienceVC.row = selectedExp
    }

}
