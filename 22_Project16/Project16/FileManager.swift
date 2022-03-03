//
//  FileManager.swift
//  Project16
//
//  Created by Dean Thompson on 2022/03/03.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
