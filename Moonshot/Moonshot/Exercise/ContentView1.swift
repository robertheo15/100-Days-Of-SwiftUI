//
//  ContentView.swift
//  Moonshot
//
//  Created by robert theo on 30/09/24.
//

import SwiftUI

struct CustomText: View {
    let  text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
//        print("Creating a new CustomText")
        self.text = text
    }
}

struct ContentView1: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomText(text: "Item \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ContentView1()
}
