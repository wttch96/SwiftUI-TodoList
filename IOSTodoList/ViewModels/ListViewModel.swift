//
//  ListViewModel.swift
//  IOSTodoList
//
//  Created by Wttch on 2022/5/24.
//

import Foundation


class ListViewModel: ObservableObject {
    private let itemKey = "todoItems"
    
    @Published var items: [ItemModel] = [] {
        didSet {
            // set 的时候调用
            saveItems()        }
    }
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            // 可以同时守卫多个变量, 不过需要逗号将多个let语句分割开来
            // 守卫，不存在立即返回
            let data = UserDefaults.standard.data(forKey: itemKey),
            // 守卫，转换失败立即返回
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems
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
    
    func saveItems() {
        // 转换为 json 保存
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
