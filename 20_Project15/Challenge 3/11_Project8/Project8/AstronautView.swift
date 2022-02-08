//
//  AstronautView.swift
//  Project8
//
//  Created by Dean Thompson on 2021/11/12.
//

import SwiftUI

struct AstronautView: View {
    
    
    let astronaut: Astronaut
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let didMissions: [String]
    
    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        
        var matches = [String]()
        
        for mission in missions {
            if mission.crew.contains(where: { $0.name == astronaut.id }) {
                matches.append("Apollo \(mission.id)")
            }
        }
        self.didMissions = matches
    }
    
    
    
                               //    init(mission: Mission, astronauts: [Astronaut]) {
//        self.mission = mission
//
//        var matches = [CrewMember]()
//
//        for member in mission.crew {
//            if let match = astronauts.first(where: { $0.id == member.name }) {
//                matches.append(CrewMember(role: member.role, astronaut: match))
//            } else {
//                fatalError("Missing \(member)")
//            }
//        }
//        self.astronauts = matches
//    }
   
    var body: some View {
        GeometryReader {
            geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    //Challenge 3
                        .accessibilityRemoveTraits(.isImage)
                    Text("Biography")
                        .padding(.top, 15)
                        .font(.title)
                    Text(self.astronaut.description)
                        .padding()
                    
                    Text("Missions Flown")
                        .bold()
                        .padding(5)
                    
                    ForEach(self.didMissions, id: \.self) { mission in
                        Text(mission)
                            .padding(.bottom, 5)
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
