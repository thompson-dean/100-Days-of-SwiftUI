//
//  ContentView.swift
//  Milestones7-9-Take3
//
//  Created by Dean Thompson on 2021/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var presentAddView = false
    @StateObject var habits = Habits()
    var body: some View {
        
        NavigationView {
            List {
                ForEach(0..<habits.items.count, id: \.self) { index in
                    NavigationLink {
                        HabitView(index: index, habits: habits)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habits.items[index].title)
                                    .font(.headline)
                                    .foregroundColor(habits.items[index].goodBad == "good" ? .green : .red)
                                Text(habits.items[index].description)
                                    .font(.subheadline)
                            }
                            Spacer()
                            Text("\(habits.items[index].count)")
                                .padding(.leading)
                        }
                    }
                    
                }.onDelete(perform: deleteItem)
            }
            .navigationTitle("Habit Tracker")
            .navigationBarItems(trailing: Button {
                presentAddView.toggle()
            } label: {
               Image(systemName: "plus")
            })
            .sheet(isPresented: $presentAddView) {
                AddView(habits: habits)
            }
        }
    }
    func deleteItem(_ offsets: IndexSet) {
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
