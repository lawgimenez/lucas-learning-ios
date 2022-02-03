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
    var colorTheme: UIColor = .orange
    
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
        letterCollectionViewCell.layer.cornerRadius = 8
        letterCollectionViewCell.backgroundColor = colorTheme
        letterCollectionViewCell.letterLabel.text = letter
        return letterCollectionViewCell
    }
}

extension AlphabetViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let letterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "letter", for: indexPath) as! LetterCollectionViewCell
        letterCollectionViewCell.backgroundColor = .brown
        let letter = arrayLetters[indexPath.row]
        let utterance = AVSpeechUtterance(string: letter.lowercased())
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.delegate = self
        synthesizer.speak(utterance)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let letterCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "letter", for: indexPath) as! LetterCollectionViewCell
        letterCollectionViewCell.backgroundColor = .orange
    }
}

extension AlphabetViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 25
        return CGSize(width: width / 5, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 4)
    }
}

extension AlphabetViewController: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        alphabetCollectionView.reloadData()
    }
}
