//
//  SwiftUIView.swift
//  Project9
//
//  Created by Dean Thompson on 2021/11/13.
//

import SwiftUI

struct CreativeBorders: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("chocolates"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.2), scale: 0.2), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorders()
    }
}
