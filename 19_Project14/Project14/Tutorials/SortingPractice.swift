//
//  SortingPractice.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import SwiftUI

// Video 1/12 Tutorial
struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct SortingPractice: View {
    let users = [
        User(firstName: "Dean", lastName: "Thompson"),
        User(firstName: "Keiko", lastName: "Tanaka"),
        User(firstName: "Lloyd", lastName: "Barrett"),
        User(firstName: "Nic", lastName: "Fayard")
    ].sorted()
    var body: some View {
        List(users){ user in
            Text("\(user.firstName) \(user.lastName)")
        }
    }
}

struct SortingPractice_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
