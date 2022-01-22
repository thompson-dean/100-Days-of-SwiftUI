//
//  GestureAnimations.swift
//  AnimationPractice
//
//  Created by Dean Thompson on 2021/10/26.
//

import SwiftUI

struct GestureAnimations: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
            DragGesture()
                .onChanged {
                    self.dragAmount = $0.translation
                }
                .onEnded { _ in
                    withAnimation(.spring()) {
                        self.dragAmount = .zero
                    }
                 
                    
                }
            )
   
    }
}

struct GestureAnimations_Previews: PreviewProvider {
    static var previews: some View {
        GestureAnimations()
    }
}
