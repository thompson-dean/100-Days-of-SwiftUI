//
//  FileManager.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/11.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = self.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
