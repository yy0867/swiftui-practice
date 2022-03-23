//
//  FirstView.swift
//  LifeCyclePractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct FirstView: View {
    
    @State private var presentView: Bool = false
    
    var body: some View {
        Button("To SecondView") {
            presentView = true
        }
        .sheet(isPresented: $presentView) {
            SecondView()
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
