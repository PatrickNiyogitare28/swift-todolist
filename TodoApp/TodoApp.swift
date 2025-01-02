//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Patrick Niyo on 02/01/2025.
//

import SwiftUI
import SwiftData

@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
