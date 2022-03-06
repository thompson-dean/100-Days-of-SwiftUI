//
//  HitTesting.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import SwiftUI

struct HitTesting: View {
    var body: some View {
        VStack {
            Text("hello")
            Spacer().frame(height: 100)
            Text("world")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack tapped")
        }
    }
}

struct HitTesting_Previews: PreviewProvider {
    static var previews: some View {
        HitTesting()
    }
}
