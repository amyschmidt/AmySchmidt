//
//  AboutMeCollectionViewCell.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/25/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class AboutMeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var aboutImage: UIImageView!
    
    func setAboutMeCell(aboutLabelText: String, aboutImageText: String) {
        
        self.aboutLabel.text = aboutLabelText
        self.aboutLabel.numberOfLines = 0
        self.aboutImage.image = UIImage(named: aboutImageText)

    }
}
