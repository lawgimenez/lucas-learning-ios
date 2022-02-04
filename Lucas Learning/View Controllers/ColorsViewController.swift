//
//  ColorsViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/3/22.
//

import UIKit
import AVFoundation

class ColorsViewController: UIViewController {
    
    @IBOutlet weak var colorsCollectionView: UICollectionView!
    
    private let arrayColors: [Color] = [
        Color(name: "Blue", color: UIColor(red: 0, green: 0, blue: 1, alpha: 1)),
        Color(name: "Red", color: UIColor(red: 1, green: 0, blue: 0, alpha: 1)),
        Color(name: "Yellow", color: UIColor(red: 1, green: 1, blue: 0, alpha: 1)),
        Color(name: "Green", color: UIColor(red: 0, green: 1, blue: 0, alpha: 1)),
        Color(name: "Orange", color: UIColor(red: 1, green: 0.5, blue: 0, alpha: 1)),
        Color(name: "Black", color: UIColor(red: 0, green: 0, blue: 0, alpha: 1)),
        Color(name: "Brown", color: UIColor(red: 0.6, green: 0.4, blue: 0.2, alpha: 1)),
        Color(name: "Cyan", color: .cyan),
        Color(name: "Magenta", color: UIColor(red: 1, green: 0, blue: 1, alpha: 1)),
        Color(name: "Purple", color: .purple),
        Color(name: "Gray", color: .gray),
        Color(name: "White", color: .white)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsCollectionView.dataSource = self
        colorsCollectionView.delegate = self
        title = "Colors"
    }
}

extension ColorsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayColors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let color = arrayColors[indexPath.row]
        let colorCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "color", for: indexPath) as! ColorCollectionViewCell
        colorCollectionViewCell.layer.cornerRadius = 20
        colorCollectionViewCell.backgroundColor = color.color
        return colorCollectionViewCell
    }
}

extension ColorsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let color = arrayColors[indexPath.row]
        let utterance = AVSpeechUtterance(string: color.name!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 2.5
        let synthesizer = AVSpeechSynthesizer()
//        synthesizer.delegate = self
        synthesizer.speak(utterance)
    }
}

extension ColorsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 15
        return CGSize(width: width / 5, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
}
