//
//  LazyHGridPracticeView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/24.
//

import SwiftUI

struct LazyHGridPracticeView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel
    var rows: [GridItem] = [.init(.fixed(800))]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(viewModel.contents, id: \.id) { content in
                    VStack {
                        Image(uiImage: UIImage(data: content.imageData!)!)
                        Text("id: \(content.id)")
                    }
                }
            }
        }
        .task {
            await viewModel.fetchContentImages()
        }
    }
}

struct LazyHGridPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        LazyHGridPracticeView()
    }
}
