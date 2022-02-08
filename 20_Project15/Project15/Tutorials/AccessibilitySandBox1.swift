//
//  AccessbilitySandBox1.swift
//  Project15
//
//  Created by Dean Thompson on 2022/02/08.
//

import SwiftUI

struct AccessibilitySandBox1: View {
    
    let pictures = ["ales-krivec-15949",
    "galina-n-189483",
    "kevin-horstmann-141705",
    "nicolas-tissot-335096"]
    
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    
    @State private var selectedPicture = Int.random(in:0...3)
    
    var body: some View {
        Image(pictures[selectedPicture])
            .resizable()
            .scaledToFit()
            .onTapGesture {
                selectedPicture = Int.random(in: 0...3)
            }
            .accessibilityLabel(labels[selectedPicture])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
    }
}

struct AccessibilitySandBox1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
