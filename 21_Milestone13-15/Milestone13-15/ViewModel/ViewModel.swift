//
//  ViewModel.swift
//  Milestone13-15
//
//  Created by Dean Thompson on 2022/02/10.
//

import Foundation
import MapKit

class ViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var source: Picker.Source = .library
    @Published var showPhotoPicker = false
    
    @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 20, longitude: 20), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    
    let filename = FileManager.default.getDocumentsDirectory().appendingPathComponent("posts")
        
    @Published var posts = [Post]() {
        didSet {
            do {
                let data = try JSONEncoder().encode(posts)
                try data.write(to: filename, options: [.atomic])
                
            } catch {
                print("Unable to save data: \(error.localizedDescription)")
            }
           
        }
    }
    
    func fetch() {
        do {
            let data = try Data(contentsOf: filename)
            posts = try JSONDecoder().decode([Post].self, from: data)
        } catch {
            // error
            posts = []
        }
    }
    
    override init() {
        do {
            let data = try Data(contentsOf: filename)
            posts = try JSONDecoder().decode([Post].self, from: data)
            
        } catch {
            // error
            posts = []
        }
    }
    
    func save(post: Post) {
        posts.append(post)
    }
    
    func delete(offsets: IndexSet) {
        posts.remove(atOffsets: offsets)
    }
    
    
    func showImagePicker() {
        if source == .camera {
            if !Picker.checkPermissions() {
                print("there is no camera on this device")
                return
            }
        }
        showPhotoPicker = true
        
    }
    
    var locationManager: CLLocationManager?

    func checkIfLocationServicesIsAvailable() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            //Alert
        }
    }
    
    func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("You are restricted")
            case .denied:
                print("Denied permission")
            case .authorizedAlways, .authorizedWhenInUse:
            mapRegion = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
            @unknown default:
                break
        }
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    
}
