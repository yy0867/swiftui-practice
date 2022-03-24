//
//  LazyVGridPracticeView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/24.
//

import SwiftUI

struct LazyVGridPracticeView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel
    var columns: [GridItem] = Array(repeating: .init(.fixed(UIScreen.main.bounds.width / 3)), count: 3)
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(viewModel.contents, id: \.id) { content in
                    
                    Image(uiImage: UIImage(data: content.imageData!)!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }.task {
            await viewModel.fetchContentImages()
        }
    }
}

struct LazyVGridPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGridPracticeView()
    }
}
