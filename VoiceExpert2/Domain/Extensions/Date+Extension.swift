//
//  Date+Extension.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/09/23.
//

import Foundation

extension Date {
    
    //例 2023/01/23 61:37
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        return formatter.string(from: self)
    }
}
