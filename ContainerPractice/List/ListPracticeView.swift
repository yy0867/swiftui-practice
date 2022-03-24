//
//  ListPracticeView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/25.
//

import SwiftUI

struct ListPracticeView: View {
    
    @EnvironmentObject var viewModel: ContentViewModel
    @State private var selection = Set<Int>()
    
    var body: some View {
        List(viewModel.contents, selection: $selection) { content in
            NavigationLink("id: \(content.id)") {
                ListPracticeDetailView(content: content)
            }
        }
        .toolbar {
            EditButton()
        }
        .task {
            await viewModel.fetchContentImages()
        }
        Text("\(selection.count) selections")
    }
}

//struct ListPracticeView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListPracticeView()
//    }
//}
