//
//  TabViewPractice.swift
//  TabViewPractice
//
//  Created by 김세영 on 2022/03/24.
//

import SwiftUI

struct TabViewPractice: View {
    var body: some View {
        TabView {
            Text("The First Tab")
                .badge(10)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                }
            Text("Another Tab")
                .tabItem {
                    ProgressView(value: 0.5)
                }
            Text("The Last Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
                    Text("Third")
                }
        }
        .font(.headline)
        .tabViewStyle(.page)
    }
}

struct TabViewPractice_Previews: PreviewProvider {
    static var previews: some View {
        TabViewPractice()
    }
}
