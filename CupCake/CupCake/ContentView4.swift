//
//  ContentView.swift
//  CupCake
//
//  Created by robert theo on 08/10/24.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }

    var name = "Taylor"
}

struct ContentView4: View {
    var body: some View {
        Button("Encode Taylor", action: encodedTaylor)
    }
    
    func encodedTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentView4()
}
