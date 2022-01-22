//
//  Arrow.swift
//  Project9
//
//  Created by Dean Thompson on 2021/11/20.
//

import SwiftUI

struct ColorCyclingRectangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        return path
        
    }
    
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX  , y: rect.height / 3))
        path.addLine(to: CGPoint(x: rect.width / 3, y: rect.height / 3))
        path.addLine(to: CGPoint(x: rect.width / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width / 1.5, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width / 1.5, y: rect.height / 3))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.height / 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
       
        
        return path
    }
    

    
}

struct ArrowView: View {
    
    @State var lineWidth: CGFloat = 1.0
    
    @State var startPointX: Double = 0.0
    @State var startPointY: Double = 0.0
    
    @State var endPointX: Double = 0.0
    @State var endPointY: Double = 0.0

    
    var body: some View {
        VStack(spacing: 0) {
            
            ColorCyclingRectangle()
                .stroke(.black, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .background(LinearGradient(colors: [.blue, .pink], startPoint: UnitPoint(x: startPointX, y: startPointY), endPoint: UnitPoint(x: endPointX, y: endPointY)))
                .padding()
            
            Spacer()
            
            
            Group {
                
                Text("start X: \(startPointX)")
                Slider(value: $startPointX, in: 0...1)
                
                Text("start Y: \(startPointY)")
                Slider(value: $startPointY, in: 0...1)
                
                Text("end X: \(endPointX)")
                Slider(value: $endPointX, in: 0...1)
                
                Text("end Y: \(endPointY)")
                Slider(value: $endPointY, in: 0...1)
            }
            
            
            Spacer()
        }
    }
}

struct Arrow_Previews: PreviewProvider {
    static var previews: some View {
        ArrowView()
    }
}
