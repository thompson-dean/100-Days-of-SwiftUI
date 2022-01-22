//
//  HabitView.swift
//  Milestones7-9-Take3
//
//  Created by Dean Thompson on 2021/11/25.
//

import SwiftUI

struct HabitView: View {
    var index: Int
    
    @ObservedObject var habits = Habits()
    var body: some View {
        Form {
            Section(header: Text("Habit")) {
                Text(habits.items[index].title)
                
            }
            Section(header: Text("Description")) {
                Text(habits.items[index].description)
                
                
            }
            Section(header: Text("Habit type")) {
                Text(habits.items[index].goodBad)
                
            }
            Section(header: Text("Count")) {
                Text("Count: \(habits.items[index].count)")
                Button("Add to count") {
                    var count = habits.items[index].count
                    count += 1
                    self.habits.items[index].count = count
                    
                }
            }
            
            
            
        }
        .navigationTitle("Habit")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct HabitView_Previews: PreviewProvider {
    static var previews: some View {
        HabitView(index: 1)
    }
}
