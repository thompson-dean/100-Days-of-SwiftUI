//
//  Habit.swift
//  Milestones7-9-Take3
//
//  Created by Dean Thompson on 2021/11/25.
//

import Foundation
import SwiftUI

struct Habit: Identifiable, Codable {
    let id = UUID()
    var title: String
    var goodBad: String
    var description: String
    var count: Int
    
}
