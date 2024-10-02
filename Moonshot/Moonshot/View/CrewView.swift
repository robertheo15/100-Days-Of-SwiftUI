//
//  CrewView.swift
//  Moonshot
//
//  Created by robert theo on 02/10/24.
//

import SwiftUI

struct CrewView: View {
    let crews: [Crew]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crews, id: \.role) { crew in
                    NavigationLink {
                        AstronautView(astronaut: crew.astronaut)
                    } label: {
                        HStack {
                            Image(crew.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(crew.role == "Commander" || crew.role == "Command Pilot" ? .yellow : .gray, lineWidth: 2)
                                )
                            VStack(alignment: .leading) {
                                Text(crew.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                    .accessibilityLabel(crew.astronaut.name.replacingOccurrences(of: ".", with: " "))

                                Text(crew.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }

    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let crews = missions[0].crew.map { member in
        if let astronaut = astronauts[member.name] {
            return Crew(role: member.role, astronaut: astronaut)
        } else {
            fatalError("Missing \(member.name)")
        }
    }


    return CrewView(crews: crews).preferredColorScheme(.dark)
}
