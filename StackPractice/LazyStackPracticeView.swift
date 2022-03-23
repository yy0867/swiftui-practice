//
//  LazyStackPracticeView.swift
//  LazyStackPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct LazyStackPracticeView: View {
    
    @State private var presentZStack: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(0...100, id: \.self) {
                        Text(String($0))
                            .padding()
                    }
                }
            }
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0...100, id: \.self) {
                        Text(String($0))
                            .padding()
                    }
                }
            }
            Button("To ZStack Practice") {
                presentZStack = true
            }
            .sheet(isPresented: $presentZStack) {
                ZStackPracticeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LazyStackPracticeView()
    }
}
