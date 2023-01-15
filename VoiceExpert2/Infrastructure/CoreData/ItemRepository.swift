//
//  ItemRepository.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2023/01/29.
//

import Foundation
import CoreData

class ItemRepositoryImpl: ItemRepositoryProtocol {
    
    private let coreDataManager = CoreDataManager.shared

    
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
    
    func fetch() -> [Item] {
        let request: NSFetchRequest<ItemCoreDataObject> = ItemCoreDataObject.fetchRequest()
        do {
            let items = try coreDataManager.viewContext.fetch(request)
            return items.map { item in
                Item(id: item.id!,
                     title: item.title!,
                     body: item.body!,
                     hasCreated: item.hasCreated!,
                     hasUpdated: item.hasCreated!)
            }
        }
        catch {
            VE2Logger.error()
            return []
        }
    }
    
    func delete(item: Item) {
        let request: NSFetchRequest<ItemCoreDataObject> = ItemCoreDataObject.fetchRequest()
        request.predicate = NSPredicate(format: "id = %@", item.id as CVarArg)
        do{
            guard let item = try coreDataManager.viewContext.fetch(request).first else {
                return
            }
            coreDataManager.viewContext.delete(item)
            try coreDataManager.viewContext.save()
        } catch {
            VE2Logger.error()
        }
    }
    
    func update() {
        
    }
    
    
}
