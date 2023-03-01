//
//  Item.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/29.
//

import Foundation

struct Item: Hashable {
    let id: UUID
    let title: String
    let body: String
    let hasCreated: Date
    let hasUpdated: Date
    
    var displayValue: String {
        return hasUpdated.toString()
    }
}
