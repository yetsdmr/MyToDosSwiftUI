//
//  MyToDosSwiftUIApp.swift
//  MyToDosSwiftUI
//
//  Created by Yunus Emre Taşdemir on 23.06.2023.
//

import SwiftUI
import SwiftData

@main
struct MyToDosSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoltem.self )
        }
    }
}
