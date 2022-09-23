//
//  CoreDataManager.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/08/30.
//

import Foundation
import CoreData

class CoreDataManager {
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return persistentStoreContainer.viewContext
    }
    
    func fetchAllItems() -> [Item] {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func save() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    func delete() {
        
    }
    
    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "VoiceExpert2")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreData 失敗 \(error)")
            }
        }
    }
}
