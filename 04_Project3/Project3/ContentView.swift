//
//  ContentView.swift
//  Project3
//
//  Created by Dean Thompson on 2021/10/19.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(colors: [.orange, .purple], startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            CapsuleText(text: "First")
            Spacer()
            CapsuleText(text:"Second")
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

