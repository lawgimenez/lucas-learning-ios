//
//  CallViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 11/28/21.
//

import UIKit
import AVFoundation

class CallViewController: UIViewController {
    
    @IBOutlet weak var callCollectionView: UICollectionView!
    private let arrayContacts: [Contact] = [
        Contact(name: "Ma Moms", speechName: "Mama", image: UIImage(named: "MaMoms")),
        Contact(name: "Lucas", speechName: "Lucas", image: UIImage(named: "Bimbim")),
        Contact(name: "Pa Pops", speechName: "Papa", image: UIImage(named: "PaPops"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callCollectionView.dataSource = self
        callCollectionView.delegate = self
    }
}

extension CallViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayContacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let callCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "call", for: indexPath) as! CallCollectionViewCell
        callCollectionViewCell.avatarImageView.image = arrayContacts[indexPath.row].image
        callCollectionViewCell.avatarImageView.contentMode = .scaleAspectFill
        callCollectionViewCell.avatarImageView.layer.cornerRadius = callCollectionViewCell.avatarImageView.frame.height / 2
        callCollectionViewCell.avatarImageView.clipsToBounds = true
        callCollectionViewCell.nameLabel.text = arrayContacts[indexPath.row].name
        return callCollectionViewCell
    }
}

extension CallViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = arrayContacts[indexPath.row].speechName
        let utterance = AVSpeechUtterance(string: name!)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 2.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

extension CallViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 30
        return CGSize(width: width / 3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
}
