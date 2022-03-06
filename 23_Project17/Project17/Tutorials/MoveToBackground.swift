//
//  MoveToBackground.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import SwiftUI

struct MoveToBackground: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .onChange(of: scenePhase) { newValue in
                if newValue == .active {
                    print("active")
                } else if newValue == .inactive {
                    print("inactive")
                } else if newValue == .background {
                    print("background")
                }
            }
    }
}

struct MoveToBackground_Previews: PreviewProvider {
    static var previews: some View {
        MoveToBackground()
    }
}
