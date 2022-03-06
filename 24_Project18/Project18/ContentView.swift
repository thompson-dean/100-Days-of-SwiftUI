//
//  ContentView.swift
//  Project18
//
//  Created by Dean Thompson on 2022/03/06.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: geo.size.width)
                        //Challenge 3 - had a lot of trouble with this ended up getting some inspiration from clarknt hacking with swiftui git hub. Took the code and reworked it for my project.
                            .background(getColor(fullView: fullView, geo: geo))
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1,z: 0))
                        //Challenge 2 - A bit janky but seems to work!
                            .scaleEffect(geo.frame(in: .global).midY / 450)
                             
                    }
                    .frame(height: 40)
                }
            }
            //Challenge 1 - I couldn't figure out how to do it using Geometry Reader so i janked a mask together to replicate what was asked in the challenge.
            .mask(
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.black, Color.black.opacity(0)]), startPoint: .bottom, endPoint: .top)
            )
        }
        
    
    }
    
    func getColor(fullView: GeometryProxy, geo: GeometryProxy) -> Color {
            let itemPercent = getItemPercent(fullView: fullView, geo: geo)

            let colorValue = Double(itemPercent / 100)
        
        return Color(hue: colorValue * 1.1 , saturation: 0.9, brightness: 1)
        }
    
    func getItemPercent(fullView: GeometryProxy, geo: GeometryProxy) -> CGFloat {
            let listHeight = fullView.size.height
            let listStart = fullView.frame(in: .global).minY
            let itemStart = geo.frame(in: .global).minY

            let itemPercent =  (itemStart - listStart) / listHeight * 100

            return itemPercent
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
