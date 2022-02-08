//
//  ContentView.swift
//  Project 7
//
//  Created by Dean Thompson on 2021/10/31.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
    
    
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            
            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
    
}

struct ContentView: View {
    
    
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                                .foregroundColor(item.amount >= 100 ? .green : .primary)
                                    
                            Text(item.type)
                        }
                        
                        Spacer()
                        Text("$\(item.amount)")
                            .font(item.amount >= 1000 ? .headline : .none)
                    }
                    //Challenge 2
                    .accessibilityElement(children: .ignore)
                    .accessibilityLabel("\(item.name) was \(item.amount) dollars and of type: \(item.type)")
                }
                .onDelete(perform: removeItems)
                
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                                    Button(action: {
                self.showingAddExpense = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddExpense) {
                if #available(iOS 15.0, *) {
                    AddView(expenses: self.expenses)
                } else {
                    // Fallback on earlier versions
                }
            }
            .navigationBarItems(leading: EditButton())
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func chooseColor() -> Color {
        
        
        
        return Color.black
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
