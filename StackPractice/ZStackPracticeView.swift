//
//  ZStackPracticeView.swift
//  StackPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct ZStackPracticeView: View {
    @State private var colors: [Color] =
    [.red, .orange, .yellow, .green, .blue, .purple]
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                ForEach(0..<colors.count) {
                    Rectangle()
                        .fill(colors[$0])
                        .frame(width: 100, height: 100)
                        .offset(x: CGFloat($0) * 10.0,
                                y: CGFloat($0) * 10.0)
                }
            }
            Spacer()
            Button("Reverse Color") {
                withAnimation {
                    colors = colors.reversed()
                }
            }
            Spacer()
        }
    }
}

struct ZStackPractice_Previews: PreviewProvider {
    static var previews: some View {
        ZStackPracticeView()
    }
}
