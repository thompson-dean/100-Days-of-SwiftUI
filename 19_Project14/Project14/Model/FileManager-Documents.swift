//
//  FileManager-Documents.swift
//  Project14
//
//  Created by Dean Thompson on 2022/02/06.
//

import Foundation

extension FileManager {
    static var documentDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
