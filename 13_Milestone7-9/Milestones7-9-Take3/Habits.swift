//
//  Habits.swift
//  Milestones7-9-Take3
//
//  Created by Dean Thompson on 2021/11/25.
//

import Foundation

class Habits: ObservableObject {
    @Published var items: [Habit] = [] {
        
        didSet {
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
                
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Habit].self, from: savedItems) {
                self.items = decoded
                return
            }
        }
        items = []
    }
    
}

