//
//  ListView.swift
//  Project9
//
//  Created by Dean Thompson on 2022/01/22.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Triangle Arc")
                }
                NavigationLink {
                    TriangleView()
                } label: {
                    Text("Triangle")
                }
                NavigationLink {
                    AffineTransform()
                } label: {
                    Text("Affine Transform")
                }
                NavigationLink {
                    MetalRendering()
                } label: {
                    Text("Metal Rendering")
                }
                NavigationLink {
                    BlursBlending()
                } label: {
                    Text("Blur Blending")
                }
                NavigationLink {
                    AnimatableDataView()
                } label: {
                    Text("Animatable Data")
                }
                NavigationLink {
                    SpirographView()
                } label: {
                    Text("Spirograph")
                }
                NavigationLink {
                    ArrowView()
                } label: {
                    Text("Arrow")
                }
            }
            .navigationTitle("Shapes")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
