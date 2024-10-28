//
//  BookwormApp.swift
//  Bookworm
//
//  Created by robert theo on 18/10/24.
//
import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
