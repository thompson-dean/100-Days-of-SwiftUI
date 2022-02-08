//
//  Project11App.swift
//  Project11
//
//  Created by Dean Thompson on 2022/01/15.
//

import SwiftUI

@main
struct Project11App: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
