//
//  ContentView.swift
//  Project1Challenge
//
//  Created by Dean Thompson on 2021/10/13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = ""
    
    @State private var fromUnit = 0
    @State private var toUnit = 0
    
    let fromUnits = ["cm", "inches"]
    let toUnits = ["cm", "inches"]
    
    let inch = 0.393
    let cm = 2.540
    
    
    
    var finalCalc: Double {
        guard let amountDouble = Double(amount) else {
            return 0
        }
    
        var result: Double = 0
        
        if toUnit == 0 && fromUnit == 0 {
            result = amountDouble
        } else if toUnit == 0 && fromUnit == 1 {
            result = amountDouble * cm
        } else if toUnit == 1 && fromUnit == 0 {
        result = amountDouble * inch
        } else if toUnit == 1 && fromUnit == 1 {
            result = amountDouble
        }
      
    return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    TextField("Length", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                
                Section(header: Text("From")) {
                    Picker("From Picker", selection: $fromUnit) {
                        ForEach(0 ..< fromUnits.count) {
                            Text(self.fromUnits[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("To")) {
                    Picker("To Picker", selection: $toUnit) {
                        ForEach(0 ..< toUnits.count) {
                            Text(self.toUnits[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(finalCalc, specifier: "%.2f")")
                }
            }.navigationTitle("Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
