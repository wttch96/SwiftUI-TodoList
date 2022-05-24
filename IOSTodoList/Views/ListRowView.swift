//
//  ListRowView.swift
//  TodoList
//
//  Created by Wttch on 2022/5/24.
//

import SwiftUI


struct ListRowView: View {
    
    let item: ItemModel

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static let model1 = ItemModel(title: "第一个项目")
    static let model2 = ItemModel(title: "第二个项目", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: model1)
            ListRowView(item: model2)
        }
    }
}
