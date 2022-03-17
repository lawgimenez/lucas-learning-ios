//
//  TypingViewController.swift
//  Lucas Learning
//
//  Created by Lawrence Gimenez on 2/3/22.
//

import UIKit
import AVFoundation

class TypingViewController: UIViewController {
    
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var speakButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextView.becomeFirstResponder()
        inputTextView.textContainerInset = UIEdgeInsets(top: 14, left: 8, bottom: 14, right: 8)
        inputTextView.layer.cornerRadius = 6
        clearButton.layer.cornerRadius = 6
        speakButton.layer.cornerRadius = 6
        title = "Typing"
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        inputTextView.text = ""
    }
    
    @IBAction func speakTapped(_ sender: UIButton) {
        if let text = inputTextView.text {
            speak(text: text)
        } else {
            speak(text: "Please type in the input box.")
        }
    }
    
    private func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 2.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}
