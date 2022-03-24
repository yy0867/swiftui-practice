//
//  ContainerPracticeView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/24.
//

import SwiftUI

struct ContainerPracticeView: View {
    
    let viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section("LazyGrid") {
                    NavigationLink("LazyVGrid Practice") {
                        LazyVGridPracticeView()
                            .environmentObject(viewModel)
                    }
                    NavigationLink("LazyHGrid Practice") {
                        LazyHGridPracticeView()
                            .environmentObject(viewModel)
                    }
                }
                Section("ForEach") {
                    NavigationLink("ForEach Practice") {
                        ForEachPracticeView()
                            .environmentObject(viewModel)
                    }
                }
                Section("List") {
                    NavigationLink("List Practice") {
                        ListPracticeView()
                            .environmentObject(viewModel)
                    }
                    NavigationLink("Hierarchy List Practice") {
                        HierarchyListPracticeView()
                    }
                }
                Section("Form") {
                    NavigationLink("Form Practice") {
                        FormPracticeView()
                    }
                }
            }
            .navigationTitle("Containers")
        }
    }
}

struct ContainerPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerPracticeView()
    }
}
