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
    
    @IBOutlet weak var futureCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        
        let future = testData[indexPath.row]
        futureCell.setFutureCell(future)
        
        futureCell.backgroundColor = UIColor.whiteColor()
        
        return futureCell
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
