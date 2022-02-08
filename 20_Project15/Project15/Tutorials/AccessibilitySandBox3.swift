//
//  AccessibilitySandBox3.swift
//  Project15
//
//  Created by Dean Thompson on 2022/02/08.
//

import SwiftUI

struct AccessibilitySandBox3: View {
    
    @State private var value = 10
    
    var body: some View {
        VStack {
            Text("Value: \(value)")
            
            Button("Increment") {
                value += 1
            }.padding()
            Button("Decrement") {
                value -= 1
            }
            .padding()
        }
        .accessibilityElement()
        .accessibilityLabel("value")
        .accessibilityValue(String(value))
        .accessibilityAdjustableAction { direction in
            switch direction {
            case .increment:
                value += 1
            case .decrement:
                value -= 1
            default:
                print("Not handled")
            }
        }
    }
}

struct AccessibilitySandBox3_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilitySandBox3()
    }
}
