//
//  TextToAudioFileUseCase.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/01.
//

import Foundation
import AVFoundation
import AudioKit


class TextToAudioUseCase: NSObject {
    
    private let synsthesizer = AVSpeechSynthesizer()
    
    override init() {
        super.init()
        synsthesizer.delegate = self
    }
    
    func create(speech: Speech, fileUrl: URL) async throws {
        try await textToCaf(speech)
        try await convertToWav(inputUrl: getAudioTempUrl(), outputUrl: fileUrl)
    }
    
    private func textToCaf(_ speech: Speech) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            
            let utterance = AVSpeechUtterance(string: speech.text)
            utterance.voice = speech.voice
            utterance.rate = speech.rate
            
            let url = getAudioTempUrl()
            var audioFile: AVAudioFile?
            
            synsthesizer.write(utterance) { buffer in
                guard let pcmBuffer = buffer as? AVAudioPCMBuffer ,
                      pcmBuffer.frameLength > 0  else {
                    return
                }
                if pcmBuffer.frameLength == 0 {
                    continuation.resume()
                }
                do {
                    if audioFile == nil {
                        audioFile = try AVAudioFile(
                            forWriting: url,
                            settings: pcmBuffer.format.settings,
                            commonFormat: .pcmFormatInt16,
                            interleaved: false
                        )
                    }
                    try audioFile?.write(from: pcmBuffer)
                } catch {
                    VE2Logger.error()
                    continuation.resume(throwing: VE2Error.unexpected)
                }
            }
        }
    }
    
    private func convertToWav(inputUrl: URL, outputUrl: URL) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            var options = FormatConverter.Options()
            options.format = .wav
            options.sampleRate = 8000
            options.bitDepth = 24
            
            let converter = FormatConverter(inputURL: inputUrl, outputURL: outputUrl)
            converter.start { error in
                if let error {
                    VE2Logger.error()
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
    
    private func getAudioTempUrl() -> URL {
        return FileManager.default.temporaryDirectory.appendingPathExtension(Constants.speechData)
    }
}

extension TextToAudioUseCase: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        
    }
    
}
