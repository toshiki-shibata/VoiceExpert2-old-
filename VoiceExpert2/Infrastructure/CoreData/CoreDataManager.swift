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

    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "VoiceExpert2")
        persistentStoreContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("CoreData 失敗 \(error)")
            }
        }
    }
}
