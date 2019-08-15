//
//  ViewController.swift
//  TextToSpeech-AVSpeechSynthesizer
//
//  Created by huzaifa on 8/14/19.
//  Copyright © 2019 huzaifa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {
    
    
    @IBOutlet var lblText: UILabel!
    
    var speechSynthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechSynthesizer.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
        mutableAttributedString.addAttribute(.foregroundColor, value: UIColor.red, range: characterRange)
        lblText.attributedText = mutableAttributedString
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        lblText.attributedText = NSAttributedString(string: utterance.speechString)
    }

    @IBAction func startPressed(_ sender: Any) {
        let string = lblText.text
        let utterance = AVSpeechUtterance(string: string!)
//        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.Ting-Ting-compact")
        utterance.rate = 0.35
        utterance.pitchMultiplier = 1.3
        speechSynthesizer.speak(utterance)
    }
    
}

