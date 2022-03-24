//
//  HierarchyListPracticeView.swift
//  ContainerPractice
//
//  Created by 김세영 on 2022/03/25.
//

import SwiftUI

struct AppleDevice: Hashable, Identifiable, CustomStringConvertible {
    
    enum OS: String {
        case iOS = "📱"
        case watchOS = "⌚️"
        case tvOS = "🖥"
        case macOS = "💻"
    }
    
    var id: Self { self }
    var name: String
    var os: OS
    var children: [AppleDevice]? = nil
    var description: String {
        switch children {
            case .none: return "\(os.rawValue) \(name)"
            case .some(_): return "\(name)"
        }
    }
    
    static var stub: [AppleDevice] = [
        .init(name: "iPhone", os: .iOS, children: [
            .init(name: "iPhone 11", os: .iOS, children: [
                .init(name: "iPhone 11", os: .iOS),
                .init(name: "iPhone 11 Pro", os: .iOS),
                .init(name: "iPhone 11 Pro Max", os: .iOS),
            ]),
            .init(name: "iPhone 12", os: .iOS, children: [
                .init(name: "iPhone 12 mini", os: .iOS),
                .init(name: "iPhone 12", os: .iOS),
                .init(name: "iPhone 12 Pro", os: .iOS),
                .init(name: "iPhone 12 Pro Max", os: .iOS),
            ]),
            .init(name: "iPhone 13", os: .iOS, children: [
                .init(name: "iPhone 13 mini", os: .iOS),
                .init(name: "iPhone 13", os: .iOS),
                .init(name: "iPhone 13 Pro", os: .iOS),
                .init(name: "iPhone 13 Pro Max", os: .iOS),
            ])
        ]),
        .init(name: "Apple Watch", os: .watchOS, children: [
            .init(name: "Apple Watch SE", os: .watchOS),
            .init(name: "Apple Watch 6", os: .watchOS),
            .init(name: "Apple Watch 7", os: .watchOS),
        ]),
        .init(name: "Apple TV", os: .tvOS, children: [
            .init(name: "Apple TV HD", os: .tvOS),
            .init(name: "Apple TV 4K", os: .tvOS),
        ]),
        .init(name: "Mac", os: .macOS, children: [
            .init(name: "MacBook M1", os: .macOS, children: [
                .init(name: "MacBook Air", os: .macOS),
                .init(name: "MacBook Pro", os: .macOS),
                .init(name: "MacBook Pro 14", os: .macOS),
                .init(name: "MacBook Pro 16", os: .macOS),
            ]),
            .init(name: "iMac M1", os: .macOS, children: [
                .init(name: "iMac M1 (2 ports)", os: .macOS),
                .init(name: "iMac M1 (4 ports)", os: .macOS),
            ]),
            .init(name: "MacMini M1", os: .macOS),
        ]),
    ]
}

struct HierarchyListPracticeView: View {
    
    @State private var selection = Set<AppleDevice>()
    
    var body: some View {
        List(AppleDevice.stub, children: \.children, selection: $selection) { device in
            Text(device.description)
        }
        .navigationTitle("Apple Device")
        .toolbar { EditButton() }
        Text("\(selection.count) items selected.")
    }
}

struct HierarchyListPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        HierarchyListPracticeView()
    }
}
