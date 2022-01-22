//
//  FilteredView.swift
//  Project12Challenges
//
//  Created by Dean Thompson on 2022/01/20.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    var body: some View {
        List(fetchRequest, id: \.self) { item in
                self.content(item)
        }
    }
    
    init(filterKey: String, filterString: String, filterValue: String,  @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: "%K \(filterString) %@", filterKey, filterValue))
        self.content = content
    }
}


