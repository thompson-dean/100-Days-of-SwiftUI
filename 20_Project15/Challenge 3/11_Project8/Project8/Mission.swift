//
//  Mission.swift
//  Project8
//
//  Created by Dean Thompson on 2021/11/10.
//

import Foundation

struct Mission: Codable, Identifiable {
    
    struct CrewRole: Codable {
        var name: String
        var role: String
    }
    
    var id: Int
    var launchDate: Date?
    var crew: [CrewRole]
    var description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
    
    var formattedNames: [String] {
        
        var names = [String]()
        for crew in crew {
            names.append(crew.name.capitalizingFirstLetter())
            
        }
        return names
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
