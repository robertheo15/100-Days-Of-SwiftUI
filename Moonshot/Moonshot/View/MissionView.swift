//
//  MissionView.swift
//  Moonshot
//
//  Created by robert theo on 01/10/24.
//

import SwiftUI

struct MissionView: View {

    
    let mission: Mission
    let crews: [Crew]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .accessibilityElement()
                    .accessibilityLabel(mission.badge)
                
                                
                VStack(alignment: .leading) {
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text("Launch date: \(self.mission.formattedLaunchDate)")
                        .foregroundStyle(.white.opacity(0.5))
                    
                    Spacer()
                    
                    Text(mission.description)
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                }
                .padding(.horizontal)
                
                CrewView(crews: crews)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crews = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return Crew(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts).preferredColorScheme(.dark)
}
