//
//  ListPracticeDetailView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/25.
//

import SwiftUI

struct ListPracticeDetailView: View {
    
    var content: Content?
    
    var body: some View {
        
        if let content = content {
            VStack {
                Image(uiImage: UIImage(data: content.imageData!)!)
                Text("id: \(content.id)")
                    .padding()
            }
        } else {
            Text("No Content")
                .font(.largeTitle)
        }
    }
}

struct ListPracticeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListPracticeDetailView()
    }
}
