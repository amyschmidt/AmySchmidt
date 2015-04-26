//
//  AmyViewController.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/25/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class AmyViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let testData = ["Background", "Coding", "Music", "Fashion", "Cooking", "Traveling"]
    let testImages = ["background.png", "coding.png", "music.png", "fashion.png", "cooking.png", "travel.png"]

    @IBOutlet weak var aboutMeCollectionView: UICollectionView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    let sectionInsets = UIEdgeInsets(top: 40.0, left: 0.0, bottom: 40.0, right: 50.0)
    let minInteritemSpacing : CGFloat = 0
    let minLineSpacing : CGFloat = 0
    
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
    }
    
    @IBAction func returnToAmy(segue: UIStoryboardSegue){
        let aboutMeDetailVC = segue.sourceViewController as! AboutMeDetailViewController
        
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
        
        let aboutCell: AboutMeCollectionViewCell = aboutMeCollectionView.dequeueReusableCellWithReuseIdentifier("AboutMeCell", forIndexPath: indexPath) as! AboutMeCollectionViewCell
        
        aboutCell.layer.cornerRadius = 8
        aboutCell.frame.size.width = (screenWidth / 2)
        aboutCell.frame.size.height = (screenHeight / 3)
        
        
        let about = testData[indexPath.row]
        let image = testImages[indexPath.row]
        aboutCell.setAboutMeCell(about, aboutImageText: image)
        
        aboutCell.backgroundColor = UIColor.whiteColor()
        
        return aboutCell
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
        var aboutMeDetailVC: AboutMeDetailViewController = segue.destinationViewController as! AboutMeDetailViewController
        
        let cell = sender as! AboutMeCollectionViewCell
        let path = self.aboutMeCollectionView.indexPathForCell(cell)
        
        var selected = path?.row
        
        println("Prepare for Segue: Item Selected: \(selected!)")
        
        aboutMeDetailVC.row = selected
    }


}
