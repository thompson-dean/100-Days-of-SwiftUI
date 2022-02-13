//
//  Post.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/09.
//


import SwiftUI
import CoreLocation


struct Post: Codable, Identifiable {
  
    var id = UUID()
    var name: String
    var description: String
    var image: UUID
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var persistedImage: UIImage {
        let url =   FileManager.default.getDocumentsDirectory().appendingPathComponent(image.uuidString)
        do {
            let data = try Data(contentsOf: url)
            if let uiImage = UIImage(data: data) {
                return uiImage
            }
        } catch {
            //error
        }
        return UIImage(systemName: "person")!
    }
    
    
    
    
    enum CodingKeys: CodingKey {
        case id, name, description, image, longitude, latitude
    }
    
    init(id: UUID, name: String, description: String, image: UUID, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.latitude = latitude
        self.longitude = longitude
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(UUID.self, forKey: .image)
        latitude = try container.decode(Double.self, forKey: .latitude)
        longitude = try container.decode(Double.self, forKey: .longitude)
        
        
        
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(image, forKey: .image)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        
                
    }
    
}

