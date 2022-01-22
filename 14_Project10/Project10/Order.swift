//
//  Order.swift
//  Project10
//
//  Created by Dean Thompson on 2022/01/13.
//

import Foundation

class CodableOrder: ObservableObject {
    @Published var order = Order()
}


struct Order: Codable {

    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        
        let nameed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        let added = streetAddress.trimmingCharacters(in: .whitespacesAndNewlines)
        let cityed = city.trimmingCharacters(in: .whitespacesAndNewlines)
        let ziped = zip.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if nameed.isEmpty || added.isEmpty || cityed.isEmpty || ziped.isEmpty {
            return false
        }
        return true
    }
    
    var cost: Double {
        // 2 dollars per cake
        
        var cost = Double(quantity) * 2
        
        //complicated cakes cost more
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
    
    init() {
        
    }
    
}
