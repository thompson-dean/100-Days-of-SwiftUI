//
//  User.swift
//  Milestone10-12
//
//  Created by Dean Thompson on 2022/01/22.
//

import Foundation

struct User: Identifiable, Codable {
    
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let friends: [Friend]
    
}
