//
//  Mission.swift
//  Moonshot
//
//  Created by robert theo on 01/10/24.
//

import Foundation



struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    //challenge 3
    let badge: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    /// Project 15, challenge 3:
    var accessibilityLaunchDate: String {
        if let date = launchDate {
            return "Mission flew on: \(date.formatted(date: .abbreviated, time: .omitted))"
        } else {
            return "Mission never flew"
        }
    }
}
