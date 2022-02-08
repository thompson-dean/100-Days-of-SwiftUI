//
//  ContentView.swift
//  Project8
//
//  Created by Dean Thompson on 2021/11/10.
//

import SwiftUI

struct ContentView: View {
    @State private var toggleScreen = true
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(missions) {
                        mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: self.astronauts)
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 110, height: 110)
                                    .padding()
                                    .padding(.bottom, 0)
                                
                                VStack(alignment: .center) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding([.top, .horizontal])
                                        .padding(.bottom, 1)
                            
                                    VStack(alignment: .center) {
                                        if(self.toggleScreen) {
                                            Text(mission.formattedLaunchDate)
                                                .foregroundColor(.white)
                                                .font(.caption)
                                                
                                        } else {
                                            
                                            ForEach(mission.formattedNames, id: \.self) { name in
                                                Text(name)
                                                    .foregroundColor(.white)
                                                    .font(.caption)
                                                    
                                                
                                            }
                                        }
                                        
                                    }
                                    .padding([.horizontal, .bottom])
                                    
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackround)
                                )
                                //Challenge 3
                                .accessibilityElement(children: .ignore)
                                .accessibilityLabel("\(mission.displayName) launched on \(mission.formattedLaunchDate == "N/A" ? "an unknown date" : " the \(mission.formattedLaunchDate)")")
                                
                            }
                            
                            
                            
                        }
                        .padding([.horizontal, .bottom])
                    }
                }
                .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .navigationBarItems(
                trailing:
                    Button(toggleScreen ? "Crew" : "Date") {
                        
                        self.toggleScreen.toggle()
                        
                    }
            )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
