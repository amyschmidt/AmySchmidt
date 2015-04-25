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
    let headers = ["Work Experience"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnToPast(segue: UIStoryboardSegue){
        let experienceDetailVC = segue.sourceViewController as! ExperienceDetailViewController
        
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return headers.count
    }
    
    //return number of items in each section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testData.count
    }
    
    
    //set cells
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let expCell: PastExperienceCollectionViewCell = pastCollectionView.dequeueReusableCellWithReuseIdentifier("ExperienceCell", forIndexPath: indexPath) as! PastExperienceCollectionViewCell
        
        
        let experience = testData[indexPath.row]
        expCell.setExperienceCell(experience)
        
        expCell.backgroundColor = UIColor.whiteColor()
        
        return expCell
    }
    
    //selection info
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let expCell: PastExperienceCollectionViewCell = pastCollectionView.dequeueReusableCellWithReuseIdentifier("ExperienceCell", forIndexPath: indexPath) as! PastExperienceCollectionViewCell

        expCell.selected = true
        
        var selectedExp = indexPath.row
        println("Collection View: Item Selected: \(selectedExp)")
        
        
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
