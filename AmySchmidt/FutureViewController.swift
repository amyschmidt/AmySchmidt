//
//  FutureViewController.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/25/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class FutureViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    let testData = ["Trunk Club Internship", "B.S. in Computer Science", "Career Goals", "Personal Goals"]
    let testImages = ["trunkclub.png", "CS.png", "career.png", "personal.png"]

    @IBOutlet weak var futureCollectionView: UICollectionView!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    let sectionInsets = UIEdgeInsets(top: 40.0, left: 0.0, bottom: 40.0, right: 0.0)
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
    
    @IBAction func returnToFuture(segue: UIStoryboardSegue){
        let futureDetailVC = segue.sourceViewController as! FutureDetailViewController
        
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
        
        let futureCell: FutureCollectionViewCell = futureCollectionView.dequeueReusableCellWithReuseIdentifier("FutureCell", forIndexPath: indexPath) as! FutureCollectionViewCell
        
        futureCell.layer.cornerRadius = 8
        futureCell.frame.size.width = (screenWidth / 2)
        futureCell.frame.size.height = (screenWidth / 3)
        
        let future = testData[indexPath.row]
        let image = testImages[indexPath.row]

        futureCell.setFutureCell(future, futureImageText: image)
        
        futureCell.backgroundColor = UIColor.whiteColor()
        
        return futureCell
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
        var futureDetailVC: FutureDetailViewController = segue.destinationViewController as! FutureDetailViewController
        
        let cell = sender as! FutureCollectionViewCell
        let path = self.futureCollectionView.indexPathForCell(cell)
        
        var selected = path?.row
        
        println("Prepare for Segue: Item Selected: \(selected!)")
        
        futureDetailVC.row = selected
    }


}
