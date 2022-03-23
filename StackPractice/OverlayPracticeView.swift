//
//  OverlayPracticeView.swift
//  StackPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct OverlayPracticeView: View {
    var body: some View {
        VStack {
            Image(systemName: "person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .overlay(alignment: .bottom) {
                    OverlayView()
                }
                .background(alignment: .top) {
                    Rectangle()
                        .foregroundColor(.gray)
                }
        }
    }
}

struct OverlayView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Rachael Chiseck")
                    .font(.headline)
                Text("Chief Executive Officer")
                    .font(.subheadline)
            }
            Spacer()
        }
        .padding()
        .foregroundColor(.primary)
        .background(Color.primary
                        .colorInvert()
                        .opacity(0.75))
    }
}

struct OverlayPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayPracticeView()
    }
}
