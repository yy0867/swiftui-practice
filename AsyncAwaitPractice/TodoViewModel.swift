//
//  TodoViewModel.swift
//  AsyncAwaitPractice
//
//  Created by 김세영 on 2022/03/23.
//

import Combine
import Foundation

class TodoViewModel: ObservableObject {
    
    @Published public private(set) var todos: [Todo] = []
    let repository: DataRepository
    
    init(repository: DataRepository) {
        self.repository = repository
    }
    
    func fetchTodos() async {
        todos = await repository.fetch()
    }
    
    func removeTodos(atOffsets offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
    
    func moveTodos(fromOffset source: IndexSet, toOffset destination: Int) {
        todos.move(fromOffsets: source, toOffset: destination)
    }
}
