//
//  NumbersViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 11/27/21.
//

import UIKit
import AVFoundation

class NumbersViewController: UIViewController {
    
    @IBOutlet weak var numbersCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numbersCollectionView.dataSource = self
        numbersCollectionView.delegate = self
    }
}

extension NumbersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let numberCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "number", for: indexPath) as! NumberCollectionViewCell
        let number = indexPath.row + 1
        numberCollectionViewCell.numberLabel.text = String(number)
        return numberCollectionViewCell
    }
}

extension NumbersViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let number = indexPath.row + 1
        let utterance = AVSpeechUtterance(string: String(number))
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
