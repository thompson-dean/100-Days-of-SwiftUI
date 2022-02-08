//
//  CheckOutView.swift
//  Project10
//
//  Created by Dean Thompson on 2022/01/13.
//

import SwiftUI

struct CheckOutView: View {
    
    @ObservedObject var codableOrder: CodableOrder
    
    @State private var stateMessage = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                        
                } placeholder: {
                    ProgressView()
                }
                //Challenge 3
                .accessibilityHidden(true)
                .frame(height: 233)
                
                Text("Your total order is \(codableOrder.order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place order", action: {
                    Task {
                    await placeOrder()
                    }
                })
                    .padding()
              
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .alert(stateMessage, isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
   
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(codableOrder.order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            stateMessage = "Thank You"
        confirmationMessage = "Your order for \(decodedOrder.quantity) x \(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmation = true
            
            
        } catch {
            stateMessage = "Error"
            confirmationMessage = "There was an error, please try again."
            showingConfirmation = true
            print("checkout failed")
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView(codableOrder: CodableOrder())
    }
}
