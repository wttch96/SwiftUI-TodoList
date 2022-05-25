//
//  IOSTodoListApp.swift
//  IOSTodoList
//
//  Created by Wttch on 2022/5/24.
//

import SwiftUI

@main
struct IOSTodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
                    .environment(\.locale, .init(identifier: "zh-Hans"))
            }
            // 可以使ipad的 navigationView 样式改变
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
