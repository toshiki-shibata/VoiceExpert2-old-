//
//  ItemRepositoryImpl.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/02.
//

import Foundation
import CoreData

class ItemDao {
    
    private let coreDataManager = CoreDataManager.shared
    
    func fetch() -> [ItemCoreDataObject] {
        let request: NSFetchRequest<ItemCoreDataObject> = ItemCoreDataObject.fetchRequest()
        do {
            return try coreDataManager.viewContext.fetch(request)
        } catch {
            VE2Logger.error()
            return []
        }
    }
    
    func delete(item: ItemCoreDataObject) {
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
    
    func save(item: Item) {
        let newItem = ItemCoreDataObject(context: coreDataManager.viewContext)
        newItem.id = UUID()
        newItem.hasCreated = Date()
        newItem.body = item.body
        newItem.title = item.title
        do {
            try coreDataManager.viewContext.save()
        } catch {
            VE2Logger.error()
        }
    }
}
