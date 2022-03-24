//
//  AsyncAwaitPracticeApp.swift
//  AsyncAwaitPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

@main
struct AsyncAwaitPracticeApp: App {
    
    let container = DIContainer()
    
    var body: some Scene {
        WindowGroup {
            AsyncAwaitPracticeView(viewModel: container.makeViewModel())
        }
    }
}

class DIContainer {
    func makeRepository() -> DataRepository {
        return TodoDataRepository()
    }
    
    func makeViewModel() -> TodoViewModel {
        return TodoViewModel(repository: makeRepository())
    }
}
