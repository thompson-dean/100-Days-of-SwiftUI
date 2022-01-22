//
//  AddView.swift
//  Milestones7-9-Take3
//
//  Created by Dean Thompson on 2021/11/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var habits = Habits()
    @State var title = ""
    @State var description = ""
    @State var goodBad = "good"
    var types = ["good", "bad"]
    @State var count = 1
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter title here...", text: $title)
                    TextField("Enter description here...", text: $description)
                }
                Section {
                    Picker("Type", selection: $goodBad) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                }
            }.navigationTitle("Add a Habit")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing:
                                        Button {
                    
                    let item = Habit(title: title, goodBad: goodBad, description: description, count: count)
                    habits.items.append(item)
                    dismiss()
                    print(habits.items.count)
                } label: {
                    Text("Save")
                }
                )
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
