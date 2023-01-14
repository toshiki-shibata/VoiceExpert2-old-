//
//  AVHelper.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/01.
//

import AVKit

struct AvHelper {
    
    static func activeAudioSession() throws {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            VE2Logger.error()
        }
    }
    
    static func deactivateAudioSession() throws {
        do {
            try AVAudioSession.sharedInstance().setActive(false)
        } catch {
            VE2Logger.error()
        }
    }
}
