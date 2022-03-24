//
//  DataRepository.swift
//  AsyncAwaitPractice
//
//  Created by 김세영 on 2022/03/23.
//

import Foundation

protocol DataRepository {
    func fetch() async -> [Todo]
}

class TodoDataRepository: DataRepository {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
    
    func fetch() async -> [Todo] {
        guard let (data, _) = try? await URLSession.shared.data(from: url) else {
            return []
        }
        guard let decoded = try? JSONDecoder().decode([Todo].self, from: data) else {
            return []
        }
        return decoded
    }
}
