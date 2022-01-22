//
//  BlursBlending.swift
//  Project9
//
//  Created by Dean Thompson on 2021/11/18.
//

import SwiftUI

struct BlursBlending: View {
    @State private var amount = 0.0
    var body: some View {
        VStack {
            Image("chocolates")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
        
    }
}

struct BlursBlending_Previews: PreviewProvider {
    static var previews: some View {
        BlursBlending()
    }
}
