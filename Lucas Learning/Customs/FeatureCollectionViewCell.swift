//
//  FeatureCollectionViewCell.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/2/22.
//

import UIKit

class FeatureCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView! {
        didSet {
            tintColor = .white
        }
    }
    @IBOutlet weak var featureNameLabel: UILabel!
}
