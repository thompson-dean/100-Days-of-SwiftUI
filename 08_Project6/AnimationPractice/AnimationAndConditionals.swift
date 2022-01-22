//
//  AnimationAndConditionals.swift
//  AnimationPractice
//
//  Created by Dean Thompson on 2021/10/26.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct AnimationAndConditionals: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("CUNT") {
                withAnimation {
                    self.isShowingRed.toggle()
                }

                
            }
            .padding(.bottom, 60)
            
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
            
        }
    }
}

struct AnimationAndConditionals_Previews: PreviewProvider {
    static var previews: some View {
        AnimationAndConditionals()
    }
}
