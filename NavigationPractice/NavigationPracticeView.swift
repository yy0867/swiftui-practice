//
//  NavigationPracticeView.swift
//  NavigationPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct User: Identifiable {
    let id: Int
    var userName: String
    let phone: String
}

struct NavigationPracticeView: View {
    
    @State var userList: [User] = []
    
    init(userList: [User] = []) {
        self.userList = userList
    }
    
    func generateRandomString(from string: String) -> String {
        let nameLength = Int.random(in: 3...10)
        let randomCharacters = string
        var randomName = ""
        for _ in 1...nameLength {
            let character = randomCharacters.randomElement()!
            randomName.append(character)
        }
        return randomName
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userList, id: \.id) { user in
                    NavigationLink(user.userName, destination: NavigationDestinationView(user: user))
                }
                .onDelete { userList.remove(atOffsets: $0) }
                .onMove { userList.move(fromOffsets: $0, toOffset: $1) }
            }
            .navigationTitle("Users")
            .toolbar {
                EditButton()
            }
        }
        .onAppear {
            if userList.isEmpty {
                for i in 1...30 {
                    let user = User(id: i,
                                    userName: generateRandomString(from: "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                                    phone: generateRandomString(from: "0123456789"))
                    userList.append(user)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPracticeView(userList: [
            .init(id: 1, userName: "asd", phone: "01012345678"),
            .init(id: 2, userName: "gefeq", phone: "12345678"),
            .init(id: 3, userName: "asdasd", phone: "012345678")
        ])
    }
}
