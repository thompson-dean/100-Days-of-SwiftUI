//
//  AccessibilitySandBox2.swift
//  Project15
//
//  Created by Dean Thompson on 2022/02/08.
//

import SwiftUI

struct AccessibilitySandBox2: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Image(decorative: "nicolas-tissot-335096")
                .accessibilityHidden(true)
        }
        
    }
}

struct AccessibilitySandBox2_Previews: PreviewProvider {
    static var previews: some View {
        AccessibilitySandBox2()
    }
}
