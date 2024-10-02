//
//  ListLayout.swift
//  Moonshot
//
//  Created by robert theo on 02/10/24.
//

import SwiftUI

struct ListLayout: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
              LazyVGrid(columns: columns) {
                  ForEach(missions) { mission in
                      NavigationLink {
                          MissionView(mission: mission, astronauts: astronauts)
                      } label : {
                          HStack {
                              Image(mission.image)
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: 100, height: 100)
                                  .padding()
                              
                              VStack {
                                  Text(mission.displayName)
                                      .font(.headline)
                                      .foregroundColor(.white)
                                  Text(mission.formattedLaunchDate)
                                      .font(.caption)
                                      .foregroundColor(.white.opacity(0.5))
                                  /// Project 15, challenge 3:
                                      .accessibilityLabel(mission.accessibilityLaunchDate)
                              }
                              .padding()
                              .frame(maxWidth: .infinity, maxHeight: .infinity)
                              .background(.lightBackground)
                          }
                          .clipShape(RoundedRectangle(cornerRadius: 10))
                          .overlay(
                              RoundedRectangle(cornerRadius: 10)
                                  .stroke(.lightBackground)
                          )
                      }
                  }
              }
              .padding([.horizontal, .bottom])
          }
          .background(.darkBackground)
          .preferredColorScheme(.dark)
        }
    }
}

    
#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    ListLayout(missions: missions, astronauts: astronauts)
    .preferredColorScheme(.dark)
}
