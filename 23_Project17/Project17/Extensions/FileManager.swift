//
//  FileManager.swift
//  Project17
//
//  Created by Dean Thompson on 2022/03/06.
//

import Foundation

extension FileManager {
    static var documentDiectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
