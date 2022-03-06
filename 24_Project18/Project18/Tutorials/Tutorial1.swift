//
//  Tutorial1.swift
//  Project18
//
//  Created by Dean Thompson on 2022/03/06.
//

import SwiftUI

struct Tutorial1: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in
                        Double(position) * -10
                    }
            }
            
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

struct Tutorial1_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial1()
    }
}
