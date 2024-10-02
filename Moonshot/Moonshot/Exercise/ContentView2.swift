//
//  ContentView.swift
//  Moonshot
//
//  Created by robert theo on 30/09/24.
//

import SwiftUI

struct ContentView2: View {
    var body: some View {
        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label : {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//                .font(.largeTitle)
//            }
            List(0..<100) { row in
                NavigationLink("Row \(row)") {
                    Text("Detail \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView2()
}
