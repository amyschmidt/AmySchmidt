//
//  PastExperienceCollectionViewCell.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/24/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class PastExperienceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var orgImage: UIImageView!
    
    func setExperienceCell( orgImageName: String) {

        self.orgImage.image = UIImage(named: orgImageName)
    }
}
