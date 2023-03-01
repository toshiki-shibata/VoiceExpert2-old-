//
//  AllItemViewMode.swift
//  VoiceExpert2
//
//  Created by Toshiki Shibata on 2022/09/23.
//

import Foundation

class AllItemViewModel: ObservableObject {
    
    private let itemRepository: ItemRepositoryProtocol
    @Published var items = [Item]()
    
    init(itemRepository: ItemRepositoryProtocol = ItemRepositoryImpl()) {
        self.itemRepository = itemRepository
        fetchItems()
    }
    
    func fetchItems() {
        self.items = itemRepository.fetch()
    }
}
