//
//  ForEachPracticeView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/24.
//

import SwiftUI

struct ForEachPracticeView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.contents) { content in
                HStack {
                    Text("id: \(content.id)")
                    Image(uiImage: UIImage(data: content.imageData!)!)
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .task {
            await viewModel.fetchContentImages()
        }
    }
}

struct ForEachPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        ForEachPracticeView()
    }
}
