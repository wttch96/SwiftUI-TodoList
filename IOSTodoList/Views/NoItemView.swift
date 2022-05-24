//
//  NoItemView.swift
//  IOSTodoList
//
//  Created by Wttch on 2022/5/25.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    let accentColor = Color("AccentColor")

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("这里什么都没有！")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("点击“添加”添加一个项目吧！")
                    .padding(.bottom, 20)
                NavigationLink(destination: {
                    AddView()
                }, label: {
                    Text("添加一条 🥳")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondaryAccentColor : accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                .shadow(
                    color: (animate ? secondaryAccentColor : accentColor).opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 50: 30
                )
            }
            .multilineTextAlignment(.center)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.easeInOut(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemView()
                .navigationTitle("什么都没有")
        }
    }
}
