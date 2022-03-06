//
//  TimeTraining.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import SwiftUI


struct TimeTraining: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
                
            }
    }
}

struct TimeTraining_Previews: PreviewProvider {
    static var previews: some View {
        TimeTraining()
    }
}
