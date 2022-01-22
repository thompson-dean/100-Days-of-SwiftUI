//
//  AddressView.swift
//  Project10
//
//  Created by Dean Thompson on 2022/01/13.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var codableOrder: CodableOrder
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $codableOrder.order.name)
                TextField("Address", text: $codableOrder.order.streetAddress)
                TextField("City", text: $codableOrder.order.city)
                TextField("Zip", text: $codableOrder.order.zip)
            }
            
            
            Section {
                NavigationLink {
                    CheckOutView(codableOrder: codableOrder)
                } label: {
                    Text("Checkout")
                }
            }
            .disabled(codableOrder.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(codableOrder: CodableOrder())
    }
}
