//
//  ContentView.swift
//  Project10
//
//  Created by Dean Thompson on 2022/01/12.
//

import SwiftUI



struct ContentView: View {
@StateObject var codableOrder = CodableOrder()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $codableOrder.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(codableOrder.order.quantity)", value: $codableOrder.order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests?", isOn: $codableOrder.order.specialRequestEnabled)
                    if codableOrder.order.specialRequestEnabled {
                        Toggle("Add sprinkles?", isOn: $codableOrder.order.addSprinkles)
                        Toggle("Any frosting?", isOn: $codableOrder.order.extraFrosting)
                    }
                    
                }
                Section {
                    NavigationLink {
                        AddressView(codableOrder: codableOrder)
                    } label: {
                        Text("Address details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
