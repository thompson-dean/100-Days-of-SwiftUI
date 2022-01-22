//
//  Bundle-Decodable.swift
//  Project8
//
//  Created by Dean Thompson on 2021/11/10.
//

import Foundation

extension Bundle {
    
    func decode<T: Decodable>(_ file: String) -> [T] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Did not find \(file) in Bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("did not load \(file) from Bundle")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode([T].self, from: data) else {
            fatalError("Did not decode \(file) from Bundle")
        }
        
        return loaded
    }
}
