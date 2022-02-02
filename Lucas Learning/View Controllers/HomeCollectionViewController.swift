//
//  HomeCollectionViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/2/22.
//

import UIKit

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var arrayFeatures: [Feature] = [
        Feature(name: "Alphabet", desc: "Listen to the letters in the alphabet.", icon: UIImage(systemName: "abc")!),
        Feature(name: "Typing", desc: "Listen to the letters in the alphabet.", icon: UIImage(systemName: "keyboard")!)
    ]
    
    @IBOutlet var featuresCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewload")
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFeatures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feature = arrayFeatures[indexPath.row]
        let featureCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "feature", for: indexPath) as! FeatureCollectionViewCell
        featureCollectionViewCell.layer.cornerRadius = 8
        featureCollectionViewCell.featureNameLabel.text = feature.name
        featureCollectionViewCell.iconImageView.image = feature.icon
        return featureCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 25
        return CGSize(width: width / 2, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
}


