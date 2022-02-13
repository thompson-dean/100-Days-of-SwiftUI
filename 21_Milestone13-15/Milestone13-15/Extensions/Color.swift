//
//  Color.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/09.
//

import Foundation
import SwiftUI

extension Color {
    
  init(_ hex: UInt, alpha: Double = 1) {
    self.init(
      .sRGB,
      red: Double((hex >> 16) & 0xFF) / 255,
      green: Double((hex >> 8) & 0xFF) / 255,
      blue: Double(hex & 0xFF) / 255,
      opacity: alpha
    )
  }
}

struct Colors {
    let darkestColor = Color(0x041C32)
    let secondDarkestColor = Color(0x04293A)
    let secondLightestColor = Color(0x064663)
    let lightestColor = Color(0xECB365)
}
