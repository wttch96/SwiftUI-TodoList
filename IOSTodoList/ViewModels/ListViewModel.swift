//
//  ListViewModel.swift
//  IOSTodoList
//
//  Created by Wttch on 2022/5/24.
//

import Foundation


class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "第一个项目"),
            ItemModel(title: "第二个项目", isCompleted: true),
            ItemModel(title: "第三个")
        ]
        
        items.append(contentsOf: newItems)
    }
    
    func removeItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(fromOffsets: IndexSet, toOffset: Int) {
        items.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title)
        
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = items[index].updateCompletion()
        }
    }
    
}
