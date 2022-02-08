//
//  MissionView.swift
//  Project8
//
//  Created by Dean Thompson on 2021/11/11.
//

import SwiftUI

struct MissionView: View {
    
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let astronauts: [CrewMember]
    
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding()
                    //Challenge 3
                        .accessibilityRemoveTraits(.isImage)
                    
                    Text(mission.formattedLaunchDate)
                        .padding(.bottom, 5)
                    
                    VStack(alignment: .leading) {
                        Text("Mission highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        
                        Text(mission.description)
                    }
                    .padding(.horizontal)
                    ForEach(self.astronauts, id: \.role) {
                        crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            HStack {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 83, height: 60)
                                    .clipShape(Capsule())
                                    .overlay(Capsule()
                                                .stroke(Color.primary, lineWidth: 1))
                                    // Challenge 3
                                    .accessibilityRemoveTraits(.isImage)
                                
                                VStack(alignment: .leading) {
                                    
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                //Challenge 3
                                .accessibilityElement(children: .ignore)
                                .accessibilityLabel("\(crewMember.astronaut.name) was a \(crewMember.role)")
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        
                    }
                    Spacer(minLength: 25)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }
    
    
}

struct MissionView_Previews: PreviewProvider {
    
    static var missions: [Mission] = Bundle.main.decode("missions.json")
    static var astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        MissionView(mission: missions[1], astronauts: astronauts)
            .preferredColorScheme(.dark)
    }
}
