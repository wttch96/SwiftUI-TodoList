//
//  AddView.swift
//  TodoList
//
//  Created by Wttch on 2022/5/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var newTodoText = ""
    
    let backgroundColor = Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1))
    
    let minCount = 3
    
    var validator: Bool {
        newTodoText.count >= minCount
    }
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("请在这里输入项目...", text: $newTodoText)
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(backgroundColor)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.pink.opacity(validator ? 0 : 1))
                    )
                
                if !validator {
                    HStack {
                        Text("长度至少为\(minCount)")
                            .font(.caption2)
                            .foregroundColor(.red)
                        Spacer()
                    }
                }
                
                
                Button(action: saveButtonPressed, label: {
                    Text("保存")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
                .buttonStyle(.plain)
            }
            .padding(14)
        }
        .navigationTitle("添加一项🖋")
    }
    
    func saveButtonPressed() {
        if validator {
            listViewModel.addItem(title: newTodoText)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
