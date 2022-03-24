//
//  ContainerPracticeApp.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/24.
//

import SwiftUI

@main
struct ContainerPracticeApp: App {
    
    let viewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContainerPracticeView()
        }
    }
}
