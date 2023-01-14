//
//  VE2Logger.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/01.
//

import os

struct VE2Logger {
    
    static let logger = Logger(subsystem: "main", category: "main")
    static let errorLogger = Logger(subsystem: "Error", category: "Error")
    
    static func print(file: String = #file, line: Int = #line) {
        let message = "\(file), \(line) L"
        logger.log(level: .default, "\(message, privacy: .public)")
    }
    
    static func error(file: String = #file, line: Int = #line) {
        let message = "\(file), \(line)L"
        errorLogger.error("\(message, privacy: .public)")
    }
}
