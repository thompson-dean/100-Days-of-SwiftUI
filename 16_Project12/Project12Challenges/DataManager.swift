//
//  DataManager.swift
//  Project12Challenges
//
//  Created by Dean Thompson on 2022/01/20.
//

import Foundation
import CoreData


class DataManager: ObservableObject {
    let container = NSPersistentContainer(name: "CoreDataProject")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data had trouble loading: \(error.localizedDescription)")
            }
        }
    }
}
