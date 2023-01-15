//
//  SpeechUseCase.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/09/20.
//

import AVFoundation

class SpeechUseCase: NSObject {
    
    static let shared = SpeechUseCase()
    @Published var state: State = .inactive
    
    enum State {gfff
        case inactive, speaking, paused
    }
    
    private let synthesizer = AVSpeechSynthesizer()
    
    private override init() {
        super.init()
        synthesizer.delegate = self
    }
    
    func play(speech: Speech) {
        let utterance = AVSpeechUtterance(string: speech.text)
        let voice = AVSpeechSynthesisVoice(language: speech.voice.language)
        utterance.rate = speech.rate
        synthesizer.speak(utterance)
    }
    
    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
}

extension SpeechUseCase: AVSpeechSynthesizerDelegate {
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        self.state = .speaking
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        self.state = .paused
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        self.state = .inactive
    }
}
