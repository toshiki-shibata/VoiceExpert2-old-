//
//  ItemRepositoryImpl.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/02.
//

import Foundation
import CoreData

class ItemRepositoryImpl: ItemRepositoryProtocol {
    
    private let coreDataManager = CoreDataManager.shared
    
    func fetch() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            return try coreDataManager.viewContext.fetch(request)
        } catch {
            VE2Logger.error()
            return []
        }
    }
    
    func delete(item: Item) {
        coreDataManager.viewContext.delete(item)
        do{
            try coreDataManager.viewContext.save()
        } catch {
            VE2Logger.error()
        }
    }
    
    func update() {
        do {
            try coreDataManager.viewContext.save()
        } catch {
            VE2Logger.error()
        }
    }
    
    func save(body: String) {
        let newItem = Item(context: coreDataManager.viewContext)
        newItem.id = UUID()
        newItem.hasCreated = Date()
        newItem.body = body
        newItem.title = "テスト"
        do {
            try coreDataManager.viewContext.save()
        } catch {
            VE2Logger.error()
        }
    }
}
