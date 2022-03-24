//
//  NavigationDestinationView.swift
//  NavigationPractice
//
//  Created by 김세영 on 2022/03/23.
//

import SwiftUI

struct NavigationDestinationView: View {
    
    @State private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .overlay(alignment: .bottom) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.userName)
                                .font(.headline)
                            Text(user.phone)
                                .font(.body)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(.white)
                    .opacity(0.8)
                }
        }
    }
}

struct NavigationDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDestinationView(user: User(id: 1, userName: "Kim", phone: "01012345678"))
    }
}
