//
//  Todo.swift
//  AsyncAwaitPractice
//
//  Created by 김세영 on 2022/03/23.
//

import Foundation

struct Todo: Identifiable, Decodable {
  var userId: Int
  var id: Int
  var title: String
  var completed: Bool
}
