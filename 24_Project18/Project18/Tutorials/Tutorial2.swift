//
//  Tutorial2.swift
//  Project18
//
//  Created by Dean Thompson on 2022/03/06.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct Tutorial2: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@DeanWThompson")
                    .alignmentGuide(.midAccountAndName) { dimensions in
                        dimensions[VerticalAlignment.center]
                    }
                Image("deanthompson")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("DEAN")
                    .alignmentGuide(.midAccountAndName) { dimensions in
                        dimensions[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

struct Tutorial2_Previews: PreviewProvider {
    static var previews: some View {
        Tutorial2()
    }
}
