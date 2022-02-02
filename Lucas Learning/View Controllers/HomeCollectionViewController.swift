//
//  HomeCollectionViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/2/22.
//

import UIKit

class HomeCollectionViewController: UICollectionViewController {
    
    private var arrayFeatures: [Feature] = [
        Feature(name: "Alphabet", desc: "Listen to the letters in the alphabet.", icon: UIImage(named: "abc")!)
    ]
    
    @IBOutlet var featuresCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFeatures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
