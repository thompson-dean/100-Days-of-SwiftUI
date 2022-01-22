//
//  ContentView.swift
//  Project 4
//
//  Created by Dean Thompson on 2021/10/23.
//

import SwiftUI

struct ContentView: View {
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date()
    }
    
    @State private var wakeUp = defaultWakeUpTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    @State private var time = ""
    @State private var showTime = ""

    func calculateBedtime() -> String {
        let model = SleepCalculator()
        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0)  * 60 * 60
        let minute = (components.minute ?? 0)  * 60
        
        do {
            let prediction = try
            model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            showTime = formatter.string(from: sleepTime)
            return showTime
            
        } catch {
            return "ERROR"
        }
    }
    func convert() {
        time = calculateBedtime()
    }
    

    var body: some View {
        NavigationView {
            Form {
                Section {
                    
                    Text("Your ideal sleep time is \(time)")
                    
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                        .datePickerStyle(.wheel)
                        .onChange(of: wakeUp, perform: {
                            value in
                            convert()
                        })
                }
                
                
                Section {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                        Text("\(sleepAmount, specifier: "%g") hours")
                    }
                }
                
                
                Section {
                    Picker("Daily coffee intake", selection: $coffeeAmount) {
                        ForEach(1 ..< 21, id: \.self) { number in
                            Text(number == 1 ? "\(number) cup" : "\(number) cups")
                        }
                    }
                }
                
                
            }
            .navigationBarTitle("BetterRest")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
