//
//  ListView.swift
//  AnimationPractice
//
//  Created by Dean Thompson on 2022/01/22.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    AnimationAndConditionals()
                } label: {
                    Text("Animation 1")
                }
                NavigationLink {
                    ArrayAnimation()
                } label: {
                    Text("Animation 2")
                }
                NavigationLink {
                    ContentView()
                } label: {
                    Text("Animation 3")
                }
                NavigationLink {
                    PracticeView2()
                } label: {
                    Text("Animation 4")
                }
                NavigationLink {
                    Practice3()
                } label: {
                    Text("Animation 5")
                }
                NavigationLink {
                    GestureAnimations()
                } label: {
                    Text("Animation 5")
                }
            }
            .navigationTitle("Animations")
            
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
