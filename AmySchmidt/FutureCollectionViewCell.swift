//
//  FutureCollectionViewCell.swift
//  AmySchmidt
//
//  Created by Amy Schmidt on 4/25/15.
//  Copyright (c) 2015 Amy Schmidt. All rights reserved.
//

import UIKit

class FutureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var futureLabel: UILabel!
    
    func setFutureCell(futureLabelText: String) {
        
        self.futureLabel.text = futureLabelText
        self.futureLabel.numberOfLines = 0
    }
}
