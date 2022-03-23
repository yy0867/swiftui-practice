//
//  SecondView.swift
//  LifeCyclePractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct SecondView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @State private var count: Int = 0
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            Text(String(count))
                .font(.largeTitle)
            Button("Increase Count") {
                count += 1
            }
            Button("Dismiss SecondView") {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .onAppear {
            print("onAppear")
        }
        .onDisappear {
            print("onDisppear")
        }
        .onChange(of: count) { newValue in
            print("onChange: \(newValue)")
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
