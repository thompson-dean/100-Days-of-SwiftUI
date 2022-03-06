//
//  Accessibility.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct Accessibility: View {
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    
    var body: some View {
        Text("Hello, World!")
            .scaleEffect(scale)
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
                
            
    }
}

struct Accessibility_Previews: PreviewProvider {
    static var previews: some View {
        Accessibility()
    }
}
