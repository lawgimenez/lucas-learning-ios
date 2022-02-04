//
//  HomeCollectionViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/2/22.
//

import UIKit

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var featuresCollectionView: UICollectionView!
    
    private var arrayFeatures: [Feature] = [
        Feature(name: "Alphabet", desc: "Listen to the letters in the alphabet.", icon: UIImage(systemName: "abc")!, colorTheme: .orange),
        Feature(name: "Typing", desc: "Listen to the letters in the alphabet.", icon: UIImage(systemName: "keyboard")!, colorTheme: .brown),
        Feature(name: "Numbers", desc: "Listen to the letters in the alphabet.", icon: UIImage(systemName: "number")!, colorTheme: .darkGray),
        Feature(name: "Colors", desc: "Listen to the letters in the alphabet.", icon: UIImage(systemName: "paintpalette.fill")!, colorTheme: .purple),
        Feature(name: "Drawing", desc: "Listen to the letters in the alphabet.", icon: UIImage(systemName: "hand.draw")!, colorTheme: .magenta)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        featureCollectionViewCell.backgroundColor = feature.colorTheme
        return featureCollectionViewCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            // Open alphabet letters
            let alphabetViewController = storyboard?.instantiateViewController(withIdentifier: "alphabet") as! AlphabetViewController
            alphabetViewController.colorTheme = .orange
            navigationController?.pushViewController(alphabetViewController, animated: true)
        } else if indexPath.row == 1 {
            let typingViewController = storyboard?.instantiateViewController(withIdentifier: "typing") as! TypingViewController
            navigationController?.pushViewController(typingViewController, animated: true)
        } else if indexPath.row == 2 {
            let numbersViewController = storyboard?.instantiateViewController(withIdentifier: "numbers") as! NumbersViewController
            navigationController?.pushViewController(numbersViewController, animated: true)
        } else if indexPath.row == 3 {
            let colorsViewController = storyboard?.instantiateViewController(withIdentifier: "colors") as! ColorsViewController
            navigationController?.pushViewController(colorsViewController, animated: true)
        } else if indexPath.row == 4 {
            let drawingViewController = storyboard?.instantiateViewController(withIdentifier: "drawing") as! DrawingViewController
            navigationController?.pushViewController(drawingViewController, animated: true)
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 25
        return CGSize(width: width / 2, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


