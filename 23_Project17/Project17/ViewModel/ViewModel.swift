//
//  ViewModel.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import SwiftUI

//CHALLENGE 5 - Create ViewModel
class ViewModel: ObservableObject {
    @Published var cards = [Card]()
    
    let savePath = FileManager.documentDiectory.appendingPathComponent("Cards")
    
    init() {
        //CHALLENGE 4 - Move from USerDefaults to Document Directory
        do {
            let data = try Data(contentsOf: savePath)
            cards = try JSONDecoder().decode([Card].self, from: data)
        } catch {
            cards = []
        }

        //USER DEFAULTS
//        if let data = UserDefaults.standard.data(forKey: "Cards") {
//            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
//                cards = decoded
//                return
//            }
//        }
//        cards = []
    }
    
    func save() {
        //CHALLENGE 4 - Move from USerDefaults to Document Directory
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("unable to retrieve Data")
        }
        
        
        
        //USER DEFAULTS
//        if let encoded = try? JSONEncoder().encode(cards) {
//            UserDefaults.standard.set(encoded, forKey: "Cards")
//        }
    }
    
    func addCard(_ card: Card) {
        cards.insert(card, at: 0)
        save()
    }
    
//    func loadData() {
//        if let data = UserDefaults.standard.data(forKey: "Cards") {
//            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
//                cards = decoded
//                return
//            }
//        }
//        cards = []
//    }
    
    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        save()
    }
    
    //Challenge 3
    func reAddCard(cards: [Card]) -> [Card] {
        return cards.shuffled()
    }
}
