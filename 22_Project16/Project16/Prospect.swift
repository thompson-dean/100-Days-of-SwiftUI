//
//  Prospect.swift
//  Project16
//
//  Created by Dean Thompson on 2022/02/22.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    var dateAdded = Date()
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        return dateFormatter.string(from: dateAdded)
    }
    
    fileprivate(set) var isConnected = false
}

@MainActor class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect]
    let saveKey = "SavedData"
    
    //CHALLENGE 3
    
    func sortedByNamePeople() {
        people = people.sorted { $0.name < $1.name }
    }
    
    func sortedByDatePeople() {
        people = people.sorted { $0.formattedDate < $1.formattedDate }
    }
    
    
    //CHALLENGE 2
    let savePath = FileManager.documentDirectory.appendingPathComponent("People")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            people = try JSONDecoder().decode([Prospect].self, from: data)
        } catch {
            people = []
        }
        
        
        
//        if let data = UserDefaults.standard.data(forKey: saveKey) {
//            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
//                people = decoded
//                return
//            }
//        }
//        //no saved data
        
        
    }
    
    private func save() {
        
        do {
            let data = try JSONEncoder().encode(people)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save Data")
        }
        
//        if let encoded = try? JSONEncoder().encode(people) {
//            UserDefaults.standard.set(encoded, forKey: saveKey)
//        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send()
        prospect.isConnected.toggle()
        save()
    }
}
