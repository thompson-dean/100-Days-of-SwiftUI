//
//  Practice3.swift
//  AnimationPractice
//
//  Created by Dean Thompson on 2021/10/26.
//

import SwiftUI

struct Practice3: View {
    @State private var enabled = false
    var body: some View {
        
        Button("Tap Me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .foregroundColor(.white)
        .animation(.default)
        .background(enabled ? Color.blue : Color.purple)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 50, damping: 3))
        
    }
}

struct Practice3_Previews: PreviewProvider {
    static var previews: some View {
        Practice3()
    }
}
