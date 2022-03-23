//
//  LazyStackPracticeView.swift
//  LazyStackPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct LazyStackPracticeView: View {
    
    @State private var presentZStack: Bool = false
    @State private var presentOverlay: Bool = false
    
    var body: some View {
        VStack {
            LazyVStackView()
            Divider()
            LazyHStackView()
            Button("To ZStack Practice") {
                presentZStack = true
                presentOverlay = false
            }
            .padding()
            .sheet(isPresented: $presentZStack) {
                ZStackPracticeView()
            }
            Button("To Overlay Practice") {
                presentZStack = false
                presentOverlay = true
            }
            .padding()
            .sheet(isPresented: $presentOverlay) {
                OverlayPracticeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LazyStackPracticeView()
    }
}

struct LazyVStackView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0...100, id: \.self) {
                    Text(String($0))
                        .padding()
                }
            }
        }
    }
}

struct LazyHStackView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0...100, id: \.self) {
                    Text(String($0))
                        .padding()
                }
            }
        }
    }
}
