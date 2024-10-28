//
//  ContentView.swift
//  Bookworm
//
//  Created by robert theo on 20/10/24.
//

import SwiftUI

struct ContentView2: View {
    @AppStorage("notes") private var notes = ""

    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    ContentView2()
}
