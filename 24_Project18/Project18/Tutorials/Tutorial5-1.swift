//
//  Tutorial5-1.swift
//  Project18
//
//  Created by Dean Thompson on 2022/03/06.
//

import SwiftUI

struct Tutorial5_1: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<20) { num in
                    GeometryReader { geo in
                        Text("Number \(num)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(.degrees(-geo.frame(in: .global).minX / 4), axis: (x: 0, y: 1, z: 0))
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

struct Tutorial5_1_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial5_1()
    }
}
