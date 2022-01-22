//
//  Project12ChallengesApp.swift
//  Project12Challenges
//
//  Created by Dean Thompson on 2022/01/20.
//

import SwiftUI

@main
struct Project12ChallengesApp: App {
    @StateObject var dataManager = DataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataManager.container.viewContext)
        }
    }
}
