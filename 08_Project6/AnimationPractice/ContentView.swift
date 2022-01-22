//
//  ContentView.swift
//  AnimationPractice
//
//  Created by Dean Thompson on 2021/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.yellow, .blue],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea()
            Button("Tap here") {
//                self.animationAmount += 1
                
            }
            .padding(50)
            .background(Color.purple)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.purple)
                    .scaleEffect(animationAmount)
                    .opacity(Double(2 - animationAmount))
                    .animation(
                        Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false)
                    )
            )
            .onAppear {
                self.animationAmount = 2
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
