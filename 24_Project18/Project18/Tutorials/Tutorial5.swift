//
//  Tutorial5.swift
//  Project18
//
//  Created by Dean Thompson on 2022/03/06.
//

import SwiftUI

struct Tutorial5: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: geo.size.width)
                       
                            .background(colors[index % 7])
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1,z: 0))
                           
                    }
                    .frame(height: 40)
                }
            }
            
            
        }
        
    
    }
}

struct Tutorial5_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial5()
.previewInterfaceOrientation(.portrait)
    }
}
