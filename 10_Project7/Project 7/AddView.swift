//
//  AddView.swift
//  Project 7
//
//  Created by Dean Thompson on 2021/10/31.
//

import SwiftUI

@available(iOS 15.0, *)
struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss
    
    @State private var showAlert = false
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Private"
    @State private var amount = ""
    static let types = ["Business", "Personal"]
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                
                Picker("Type", selection: $type) {
                    ForEach(Self.types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
                
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text("Please enter numbers only"), dismissButton: .default(Text("OK")))
            }
            .navigationTitle("Add new expense")
            .navigationBarItems(trailing:
                                    Button("Save") {
                if let actualAmount = Int(self.amount) {
                    let item = ExpenseItem(name: self.name, type: self.type, amount: actualAmount)
                    self.expenses.items.append(item)
                    dismiss()
                    
                } else {
                    showAlert = true
                    
                }
            })
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            AddView(expenses: Expenses())
        } else {
            // Fallback on earlier versions
        }
    }
}
