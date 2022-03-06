//
//  Tutorial3.swift
//  Project18
//
//  Created by Dean Thompson on 2022/03/06.
//

import SwiftUI

struct Tutorial3: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

struct Tutorial3_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial3()
    }
}
