//
//  StrokeBorderTime.swift
//  Project9
//
//  Created by Dean Thompson on 2021/11/17.
//

import SwiftUI

struct Flower: Shape {
    var petalOffest = -20.0
    var petalWidth = 100.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        for number in stride(from: 0, to: Double.pi * 2, by: Double.pi / 8) {
            let rotation = CGAffineTransform(rotationAngle: number)
            let position = rotation.concatenating(CGAffineTransform(translationX: rect.width / 2, y: rect.height/2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: petalOffest, y: 0, width: petalWidth, height: rect.width/2))
            
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
        }
        
        
        return path
    }
}

struct AffineTransform: View {
    @State private var petalOffset = -20.0
    @State private var petalWidth = 100.0
    
    var body: some View {
        VStack {
            Flower(petalOffest: petalOffset, petalWidth: petalWidth)
                
                .fill(.red, style: FillStyle(eoFill: true, antialiased: true))
            Text("Offset")
            Slider(value: $petalOffset, in: -40...40)
                .padding([.horizontal, .bottom])
            
            Text("Width")
            Slider(value: $petalWidth, in: 0...100)
                .padding(.horizontal)
            
            
        }
        
        
        
    }
}

struct StrokeBorderTime_Previews: PreviewProvider {
    static var previews: some View {
        AffineTransform()
    }
}
