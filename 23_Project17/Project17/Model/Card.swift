//
//  Card.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/04.
//

import Foundation

struct Card: Codable, Identifiable {
    var id = UUID()
    let prompt: String
    let answer: String
    static let example = Card(prompt: "皮肉って英語でどういう意味でしょうか", answer: "ironyという意味です。")
}
