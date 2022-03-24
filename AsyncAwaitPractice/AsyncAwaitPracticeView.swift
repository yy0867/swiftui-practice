//
//  AsyncAwaitPracticeView.swift
//  AsyncAwaitPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct AsyncAwaitPracticeView: View {
    
    @ObservedObject private var viewModel: TodoViewModel
    @State private var isLoding: Bool = false
    
    init(viewModel: TodoViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        if isLoding {
            ProgressView()

        } else {
            NavigationView {
                List {
                    ForEach(viewModel.todos, id: \.id) { todo in
                        NavigationLink(todo.title, destination: TodoDetailView())
                    }
                    .onDelete { index in
                        viewModel.removeTodos(atOffsets: index)
                    }
                    .onMove { source, dest in
                        viewModel.moveTodos(fromOffset: source, toOffset: dest)
                    }
                }
                .navigationTitle("Todos")
                .toolbar {
                    EditButton()
                }
                .task {
                    await viewModel.fetchTodos()
                }
            }
        }
    }
}

struct IndicatorView: View {
    var body: some View {
        ProgressView()
    }
}

struct ContentView_Previews: PreviewProvider {
    
    class FakeDataRepository: DataRepository {
        func fetch() async -> [Todo] {
            var todos: [Todo] = []
            for i in 1...20 {
                todos.append(Todo(userId: i % 10,
                                  id: i,
                                  title: "Title \(i)",
                                  completed: Bool.random()))
            }
            return todos
        }
    }
    
    static let viewModel = TodoViewModel(repository: FakeDataRepository())
    
    static var previews: some View {
        AsyncAwaitPracticeView(viewModel: viewModel)
    }
}
