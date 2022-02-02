//
//  AlphabetViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 11/27/21.
//

import UIKit
import AVFoundation

class AlphabetViewController: UIViewController {
    
    @IBOutlet weak var alphabetCollectionView: UICollectionView!
    private let arrayLetters = [
        "A", "B", "C", "D",
        "E", "F", "G", "H",
        "I", "J", "K", "L",
        "M", "N", "O", "P",
        "Q", "R", "S", "T",
        "U", "V", "W", "X",
        "Y", "Z"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alphabetCollectionView.dataSource = self
        alphabetCollectionView.delegate = self
    }
}

extension AlphabetViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayLetters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let letter = arrayLetters[indexPath.row]
        let letterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "letter", for: indexPath) as! LetterCollectionViewCell
        letterCollectionViewCell.letterLabel.text = letter
        return letterCollectionViewCell
    }
}

extension AlphabetViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let letter = arrayLetters[indexPath.row]
        let utterance = AVSpeechUtterance(string: letter.lowercased())
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
