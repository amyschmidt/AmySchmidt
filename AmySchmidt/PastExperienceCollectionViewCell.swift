//
//  PastExperienceCollectionViewCell.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/24/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class PastExperienceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var orgName: UILabel!
    @IBOutlet weak var orgImage: UIImageView!
    
    func setExperienceCell(orgLabelText: String, orgImageText: String) {

        self.orgName.text = orgLabelText
        self.orgName.numberOfLines = 0
        self.orgImage.image = UIImage(named: orgImageText)
    }
}
