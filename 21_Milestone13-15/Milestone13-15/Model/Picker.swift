//
//  Picker.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/10.
//

import Foundation
import UIKit

enum Picker {
    enum Source: String {
        case library, camera
    }
    
    static func checkPermissions() -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            return true
        } else {
            print("Not compatible")
            return false
        }
    }
}
