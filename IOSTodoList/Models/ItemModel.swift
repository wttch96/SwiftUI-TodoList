//
//  TodoModel.swift
//  TodoList
//
//  Created by Wttch on 2022/5/24.
//

import Foundation


struct ItemModel: Identifiable {
    let id: String
    // 标题
    let title: String
    // 是否完成
    let isCompleted: Bool
    
    // 使用参数默认值
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        ItemModel(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}
