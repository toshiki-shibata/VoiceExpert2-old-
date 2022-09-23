//
//  AllItemViewMode.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/09/23.
//

import Foundation

class AllItemViewModel: ObservableObject {
    @Published var items = [Item]()
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        self.items = CoreDataManager.shared.fetchAllItems()
    }
}
