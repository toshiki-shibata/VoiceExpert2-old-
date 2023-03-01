//
//  Speech.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/01.
//

import Foundation
import AVFoundation

struct Speech {
    var text: String
    var rate: Float
    var voice: AVSpeechSynthesisVoice
}
