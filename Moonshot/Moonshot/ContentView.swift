//
//  ContentView.swift
//  Moonshot
//
//  Created by robert theo on 30/09/24.
//

import SwiftUI

struct ContentView: View {
    let astrounauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var isShowCrewNames = true
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    /// challenge 3:
    @AppStorage("ViewType") private var showingGrid = true
    
    var body: some View {
        NavigationView {
            /// Challenge 3:
            Group {
                if showingGrid {
                    GridLayout(missions: missions, astronauts: astrounauts)
                } else {
                    ListLayout(missions: missions, astronauts: astrounauts)
                }
            }
            /// Challenge 3:
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        Label(showingGrid ? "List View" : "Grid View", systemImage: showingGrid ? "list.dash" : "square.grid.2x2")
                    }
                    .foregroundColor(.white)
                }
            }
            .navigationTitle("Moonshot")
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
