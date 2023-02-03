//
//  ItemRepositoryProtocol.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/09/01.
//

import Foundation

protocol ItemRepositoryProtocol {
    func save(item: Item)

    func fetch() -> [Item]
    
    func delete(item :Item)
    
    func update()
}
