//
//  PracticeView2.swift
//  AnimationPractice
//
//  Created by Dean Thompson on 2021/10/26.
//

import SwiftUI

struct PracticeView2: View {
    @State private var animationAmount = 0.0
  
    var body: some View {
        
        Button("Tap here") {
            withAnimation(
                .interpolatingSpring(
                    stiffness: 5,
                    damping: 1)
            ){
                self.animationAmount += 360
            }
        }
        .padding(50)
        .background(Color.purple)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 1, y: 0, z: 0))
                
            }
        }

struct PracticeView2_Previews: PreviewProvider {
    static var previews: some View {
        PracticeView2()
    }
}
