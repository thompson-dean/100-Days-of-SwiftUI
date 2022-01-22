//
//  ContentView.swift
//  Project12Challenges
//
//  Created by Dean Thompson on 2022/01/20.
//

import CoreData
import SwiftUI

struct ContentView: View {
    
    
    
    
    @Environment(\.managedObjectContext) var moc

    @State private var lastNameFilter = "A"
    var body: some View {
        VStack {
            
            FilteredList(filterKey: "lastName", filterString: "BEGINSWITH", filterValue: lastNameFilter) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Atkins"
                
                try? moc.save()
                
            }
            
            Button("Show A") {
                lastNameFilter = "A"
            }
            
            Button("Show S") {
                lastNameFilter = "S"
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
